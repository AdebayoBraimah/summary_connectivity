#!/usr/bin/env python3

'''Computes a summary connectivity score by computing the Pearson correlation within a given network
or a set of ROIs (in the same CIFTI file), and then reports the mean of the lower triangular of the 
correlation (covariance) matrix (offset by -1 to remove the main diagonal).
'''

# Google style guide:
# https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html
#
# Numpy style guide:
# https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_numpy.html#example-numpy

# Import packages/modules
import subprocess
import logging
import os
import numpy as np
import random
import shutil
import platform
import sys

# Import modules/packages argument parser
import argparse

# Define main function
def main():
    '''main function
    - Checks system platform
    - Checks for required external software dependencies outside of python
    - Parses arguments
    '''

    # Check system
    if platform.system().lower() == 'windows':
        print("")
        print("\tThe required software (FSL) is not installable on Windows platforms. Exiting.")
        print("")
        sys.exit(1)

    # Check for external dependencies
    if not shutil.which("fslmeants"):
        print("")
        print("\tThe required software (FSL) is not installed or on the system path. Exiting.")
        print("")
        sys.exit(1)

    if not shutil.which("wb_command"):
        print("")
        print("\tThe required software (Connectome Workbench) is not installed or on the system path. Exiting.")
        print("")
        sys.exit(1)

    # Argument parser
    parser = argparse.ArgumentParser(
        description="Computes the Pearson correlation coefficient within a given number of networks/ROIs within a CIFTI dscalar or dlabel file. \
                    Additionally, should more than one network be provided, then the Pearson correlation is computed between them as well.")

    # Parse Arguments
    # Required Arguments
    reqoptions = parser.add_argument_group('Required arguments')
    reqoptions.add_argument('-i', '-in', '--input',
                            type=str,
                            dest="cii_file",
                            metavar="CIFTI.dtseries.nii",
                            required=True,
                            help="CIFTI-2 dense timeseries file (e.g. subject's fMRI timeseries mapped to some surface).")
    reqoptions.add_argument('-l', '--left-surface',
                            type=str,
                            dest="left_surf",
                            metavar="LEFT.gii",
                            required=True,
                            help="Left GIFTI surface (preferably midthickness file).")
    reqoptions.add_argument('-r', '--right-surface',
                            type=str,
                            dest="right_surf",
                            metavar="RIGHT.gii",
                            required=True,
                            help="Right GIFTI surface (preferably midthickness file).")
     reqoptions.add_argument('-n', '--network',
                            type=str,
                            dest="label",
                            metavar="CIFTI.dscalar.nii",
                            required=True,
                            action='append',
                            # nargs='+',
                            help="Input dscalar or dlabel files [Repeatable].")
     reqoptions.add_argument('-o', '-out', '--output-prefix',
                            type=str,
                            dest="out_prefix",
                            metavar="CIFTI.dscalar.nii",
                            required=True,
                            action='append',
                            # nargs='+',
                            help="Output prefixes for corresponding input network/label files. [Repeatable]")

    # Optional Arguments
    optoptions = parser.add_argument_group('Optional arguments')
    optoptions.add_argument('-t', '-thresh', '--thresh',
                            type=float,
                            dest="thresh",
                            metavar="FLOAT",
                            default=1,
                            required=False,
                            help="Surface cluster threshold. [default: 1]")
    optoptions.add_argument('-m', '--min-size',
                            type=float,
                            dest="min_sizen",
                            metavar="INT",
                            default=20,
                            required=False,
                            help="Volume cluster threshold. [default: 20]")
    optoptions.add_argument('-log', '--log-file',
                            type=str,
                            dest="log_file",
                            metavar="LOG",
                            default="log_file.log",
                            required=False,
                            help="Log file name. [default: 'log_file.log']")
    optoptions.add_argument('--debug',
                            dest="debug",
                            action="store_true",
                            required=False,
                            default=False,
                            help="Enables printing of diagnostic messages. [default: 'disabled']")
    optoptions.add_argument('--dry-run',
                            dest="dryrun",
                            action="store_true",
                            required=False,
                            default=False,
                            help="Preforms dry-run (e.g. no files are created). [default: 'disabled']")
    optoptions.add_argument('-v', '--verbose',
                            dest="verbose",
                            action="store_true",
                            required=False,
                            default=False,
                            help="Enables printing of verbose messages. [default: 'disabled']")

    args = parser.parse_args()

    # Print help message in the case
    # of no arguments
    try:
        args = parser.parse_args()
    except SystemExit as err:
        if err.code == 2:
            parser.print_help()

    # Run program
    corr_comp_multi_roi(cii=args.cii_file,
                    labels=args.label,
                    out_prefixes=args.out_prefix,
                    left_surf=args.left_surf,
                    right_surf=args.right_surf,
                    thresh=args.thresh,
                    min_size=args.min_size,
                    log_file=args.log_file,
                    debug=args.debug,
                    dryrun=args.dryrun,
                    verbose=args.verbose)
    return None

# Define class(es)
class Command(object):
    '''Creates a command and an empty command list for UNIX command line programs/applications. Primary use and
    use-cases are intended for the subprocess module and its associated classes (i.e. Popen/call/run).
    
    Attributes (class and instance attributes):
        command (instance): Command to be performed on the command line.
        cmd_list (instance): Mutable list that can be appended to.
    
    Modules/Packages required:
        - os
        - logging
        - subprocess
    '''

    def __init__(self,command):
        '''Init doc-string for Command class. Initializes a command to be used on UNIX command line.
        The input argument is a command (string), and a mutable list is returned (, that can later
        be appended to).
        
        Usage:
            echo = Command("echo")
            echo.cmd_list.append("Hi!")
            echo.cmd_list.append("I have arrived!")
        
        Arguments:
            command (string): Command to be used. Note: command used must be in system path
        Returns:
            cmd_list (list): Mutable list that can be appended to.
        '''
        self.command = command
        self.cmd_list = [f"{self.command}"]
        
    def log(self,log_file="log_file.log",log_cmd=""):
        '''Log function for logging commands and messages to some log file.
        
        Usage:
            # Initialize the `log` function command
            log_msg = Command("log")
            
            # Specify output file and message
            log_msg.log("sub.log","test message 1")
            
            # Record message, however - no need to re-initialize `log` funcion command or log output file
            log_msg.log("test message 2")
        
        NOTE: The input `log_file` only needs to be specified once. Once specified,
            this log is written to each time this or the `run` function is invoked.
        
        Arguments:
            log_file (file): Log file to be written to. 
            log_cmd (str): Message to be written to log file.
        '''
        
        # Set-up logging to file
        logging.basicConfig(level=logging.INFO,
                            format='%(asctime)s %(name)-12s %(levelname)-8s %(message)s',
                            datefmt='%d-%m-%y %H:%M:%S',
                            filename=log_file,
                            filemode='a')
        
        # Define a Handler which writes INFO messages or higher to the sys.stderr
        console = logging.StreamHandler()
        console.setLevel(logging.INFO)
        
        # Add the handler to the root logger
        logging.getLogger().addHandler(console)
        
        # Define logging
        logger = logging.getLogger(__name__)
        
        # Log command/message
        logger.info(f"{log_cmd}")
        
    def run(self,log_file="",debug=False,dryrun=False,env=None,stdout="",shell=False):
        '''Uses python's built-in subprocess class to execute (run) a command from an input command list.
        The standard output and error can optionally be written to file.
        
        Usage:
            echo.run() # This will return tuple (returncode,log,None,None), but will echo "Hi!" to screen.
            
        NOTE: 
            - The contents of the 'stdout' output file will be empty if 'shell' is set to True.
            - Once the log file name 'log_file' has been set, that value is stored and cannot be changed.
                - This log file will continue to be appended to for each invocation of this class.
        Arguments:
            log_file (file): Output log file name.
            debug (bool): Sets logging function verbosity to DEBUG level.
            dryrun (bool): Dry run -- does not run task. Command is recorded to log file.
            env (dict): Dictionary of environment variables to add to subshell.
            stdout (file): Output file to write standard output to.
            shell (bool): Use shell to execute command.
            
        Returns:
            p.returncode (int): Return code for command execution should the 'log_file' option be used.
            log_file (file): Output log file with appended information should the 'log_file' option be used.
            stdout (file): Standard output writtent to file should the 'stdout' option be used.
            stderr (file): Standard error writtent to file should the 'stdout' option be used.
        '''
        
        # Define logging
        logger = logging.getLogger(__name__)
        cmd = ' '.join(self.cmd_list) # Join list for logging purposes
        
        if debug:
            logger.debug(f"Running: {cmd}")
        else:
            logger.info(f"Running: {cmd}")
        
        if dryrun:
            logger.info("Performing command as dryrun")
            return 0
        
        # Define environment variables
        merged_env = os.environ
        if env:
            merged_env.update(env)
        
        # Execute/run command
        p = subprocess.Popen(self.cmd_list,shell=shell,env=merged_env,
                        stdout=subprocess.PIPE,stderr=subprocess.PIPE)

        # Write log files
        out,err = p.communicate()
        out = out.decode('utf-8')
        err = err.decode('utf-8')

        # Write std output/error files
        if stdout:
            stderr = os.path.splitext(stdout)[0] + ".err"
            with open(stdout,"w") as f_out:
                with open(stderr,"w") as f_err:
                    f_out.write(out)
                    f_err.write(err)
                    f_out.close(); f_err.close()
        else:
            stdout = None
            stderr = None

        if p.returncode:
            logger.error(f"command: {cmd} \n Failed with returncode {p.returncode}")

        if len(out) > 0:
            if debug:
                logger.debug(out)
            else:
                logger.info(out)

        if len(err) > 0:
            if debug:
                logger.info(err)
            else:
                logger.warning(err)
        return p.returncode,log_file,stdout,stderr

# Define functions
def find_cii_clusters(cii_file,
                      out_file,
                      left_surf,
                      right_surf,
                      thresh,
                      min_size,
                      log_file="",
                      debug=False,
                      dryrun=False,
                      env=None,
                      stdout="",
                      shell=False):
    '''Finds cluster in a CIFTI file.
    
    Args:
        cii_file (CIFTI file, str): Input CIFTI file.
        out_file (file, str): Output CIFTI file name (including file extension).
        left_surf (GIFTI file, str): Input left group surface GIFTI file.
        right_surf (GIFTI file, str): Input right group surface GIFTI file.
        thresh (float): Threshold all values below this value.
        min_size (int): Threshold for surface area and volume.
        log_file (file, str): Log file name.
        debug (bool): Sets logging function verbosity to DEBUG level.
        dryrun (bool): Dry run -- does not run task. Command is recorded to log file.
        env (dict): Dictionary of environment variables to add to subshell.
        stdout (file, str): Output file to write standard output to.
        shell (bool): Use shell to execute command.
    
    Returns:
        out_file (CIFTI file, str): Output CIFTI file with clusters.
    
    Raises:
        TypeError: `thresh` should be float, and `min_size` should int.
    '''
    
    # Check input values
    if type(thresh) != float and type(thresh) != int:
        raise TypeError(f"Input value for thresh arg is a {type(thresh)} not a float or an int.")
        sys.exit(1)
    if type(min_size) != float and type(min_size) != int:
        raise TypeError(f"Input value for min_size arg is a {type(min_size)} not a float or an int.")
        sys.exit(1)

    # Convert int to str
    thresh = str(thresh)
    min_size = str(min_size)
    
    # Init UNIX command
    find_clusters = Command("wb_command")
    find_clusters.cmd_list.append("-cifti-find-clusters")
    find_clusters.cmd_list.append(cii_file)
    find_clusters.cmd_list.append(thresh)
    find_clusters.cmd_list.append(min_size)
    find_clusters.cmd_list.append(thresh)
    find_clusters.cmd_list.append(min_size)
    find_clusters.cmd_list.append("COLUMN")
    find_clusters.cmd_list.append(out_file)
    find_clusters.cmd_list.append("-left-surface")
    find_clusters.cmd_list.append(left_surf)
    find_clusters.cmd_list.append("-right-surface")
    find_clusters.cmd_list.append(right_surf)
    
    # execute command
    [exit_status,log_file,stdout,stderr] = find_clusters.run(log_file,
                                                             debug=debug,
                                                             dryrun=dryrun,
                                                             env=env,
                                                             stdout=stdout,
                                                             shell=shell)

    return out_file

def cifti_to_nifti(cii,out,log_file="",debug=False,dryrun=False,env=None,stdout="",shell=False):
    '''Performs conversion of input CIFTI-2 file to NIFTI-1 file via
    wb_command -cifti-convert.
    
    Arguments:
        cii (file): Input CIFTI-2 file.
        out (file): Output file name for NIFTI-1 file.
        log_file (log): Log file to be written to. 
            - NOTE: if the log function has been used previously, then this argument need not be assigned.
        debug (bool): Turn on logging's diagnostic messaging.
        dryrun (bool): Perform dryrun (i.e. does not generate any files).
        env (dict): Dictionary of environmental variables.
        stdout (file): Standard output file to be written to.
            - NOTE: This file can only be written to if `shell` is set to False.
        shell (bool): Run the command using a shell.
        
    Returns:
        out(file): Output file name for NIFTI-1 file.
    '''
    
    # Format variable
    if '.nii.gz' not in out:
        out = out + ".nii.gz"
    
    # Init UNIX command
    cii_to_nii = Command("wb_command")
    cii_to_nii.cmd_list.append("-cifti-convert")
    cii_to_nii.cmd_list.append("-to-nifti")
    cii_to_nii.cmd_list.append(f"{cii}")
    cii_to_nii.cmd_list.append(f"{out}")
    
    # Execute command
    [exit_status,log_file,stdout,stderr] = cii_to_nii.run(log_file=log_file,
                                                          debug=debug,
                                                          dryrun=dryrun,
                                                          env=env,
                                                          stdout=stdout,
                                                          shell=shell)
    
    return out

def meants(nii,out,label,log_file="",debug=False,dryrun=False,env=None,stdout="",shell=False,verbose=False):
    '''Performs mean timeseries extraction from 4D timeseries using mask/label
    file.
    
    Arguments:
        nii (file): Input NIFTI-1 file
        out (file): Output file name for NIFTI-1 mean timeseries
        label (file): Input NIFTI-1 label file (dimensions must match input NIFTI-1 file)
        log_file (log): Log file to be written to. 
            - NOTE: if the log function has been used previously, then this argument need not be assigned.
        debug (bool): Turn on logging's diagnostic messaging
        dryrun (bool): Perform dryrun (i.e. does not generate any files)
        env (dict): Dictionary of environmental variables
        stdout (file): Standard output file to be written to.
            - NOTE: This file can only be written to if `shell` is set to False.
        shell (bool): Run the command using a shell.
        verbose (bool): Turn on verbose/diagnostic messages for UNIX command
    Returns:
        out(file): Output file name for NIFTI-1 file
    '''
    
    # Format variable
    if '.txt' not in out:
        out = out + ".txt"
    
    # Init UNIX command
    mean_ts = Command("fslmeants")
    mean_ts.cmd_list.append("-i"); mean_ts.cmd_list.append(f"{nii}")
    mean_ts.cmd_list.append("-o"); mean_ts.cmd_list.append(f"{out}")
    mean_ts.cmd_list.append(f"--label={label}")
    # mean_ts.cmd_list.append(f"{label}")
    
    if verbose:
        mean_ts.cmd_list.append("--verbose")
    
    # Execute command 
    [exit_status,log_file,stdout,stderr] = mean_ts.run(log_file=log_file,
                                                      debug=debug,
                                                      dryrun=dryrun,
                                                      env=env,
                                                      stdout=stdout,
                                                      shell=shell)
    return out

def pearson_corr(file1,log_file=""):
    '''Computes Pearson correlation for a N x M matrix/array
    that is stored as a text file.
    
    Arguments:
        file1 (file): Input file containing N x M matrix
        log_file (log): Log file to be written to. 
        
    Returns:
        Pearson correlation coefficient (float): Pearson correlation coefficients.
    '''
    
    # Log message
    log_msg = Command("log")
    log_msg.log(log_file=log_file,
                log_cmd="Computing Pearson correlation")
    
    # Load files
    A = np.loadtxt(file1)
    
    # Compute Pearson correlation (assumes A is N x N matrix)
    a = np.corrcoef(A,rowvar=False)
    
    # Retain lower triangular of correlation matrix,
    # offset by -1 to exclude main diagonal
    return a[np.tril_indices(len(a),k=-1)]

def write_arr(arr,out_file):
    '''Writes numpy array to file.
    
    Args:
        arr (:obj: `numpy array` of `floats`): Numpy array of values.
        out_file (file, `str`): Output file name.
    
    Returns:
        out_file (file, `str`): Output file containing array information.
    '''
    
    try:
        out_file = np.savetxt(out_file,arr,fmt="%.4f")
    except ValueError:
        with open(out_file,"w") as file:
            file.write(f"{arr:4f}\n")
            file.close()
            
    return out_file

def corr_comp_multi_roi(cii,
                        labels,
                        out_prefixes,
                        left_surf,
                        right_surf,
                        thresh=0,
                        min_size=0,
                        log_file="",
                        debug=False,
                        dryrun=False,
                        env=None,
                        stdout="",
                        verbose=False,
                        shell=False):
    '''Computes 'connectivity score' of a network or networks by computing the
    mean timeseries from each cluster of greyordinates within the network and
    computing the Pearson correlation between each set of clusters for each network.
    
    Additionally, should more than one network be used as input, then the mean connectivity
    is also collectively computed between all clusters/ROIs.
    
    Output files include:
        - Output prefixed files for each network/ROI.
        - Connectivity score for all networks.
            - Appended with 'all_labels.mean_corr.txt'
            - Only applicable when more than network is used as input
            
    Args:
        cii_file (CIFTI file, str): Input CIFTI file.
        labels (:obj:`list` of :obj:`str`): List of label/network/ROI CIFTI files to mask input CIFTI timeseries.
        out_prefixes (:obj:`list` of :obj:`str`): Corresponding output prefixes for each input CIFTI label mask.
        left_surf (GIFTI file, str): Input left group surface GIFTI file.
        right_surf (GIFTI file, str): Input right group surface GIFTI file.
        thresh (float): Threshold all values below this value.
        min_size (int): Threshold for surface area and volume.
        log_file (file, str): Log file name.
        debug (bool): Sets logging function verbosity to DEBUG level.
        dryrun (bool): Dry run -- does not run task. Command is recorded to log file.
        env (dict): Dictionary of environment variables to add to subshell.
        stdout (file, str): Output file to write standard output to.
        shell (bool): Use shell to execute command.
    '''
    
    # Check input list length
    if len(labels) != len(out_prefixes):
        raise IndexError("Input lists `lables` and `out_prefixes` are of different lengths")
        sys.exit(1)
    
    # Ascertain absolute file paths
    cii = os.path.abspath(cii)
    labels = [ os.path.abspath(label) for label in labels ]
    log_file = os.path.abspath(log_file)
    
    out_dir = os.path.abspath(os.path.dirname(out_prefixes[0]))
    out_names = [ os.path.basename(out_prefix) for out_prefix in out_prefixes ]
    
    # Create temporary directory
    cwd = os.getcwd()
    n = 10000 # maximum N for random number generator
    tmp_dir = os.path.join(out_dir, 'tmp_dir_' + str(random.randint(0, n)))
    
    if not os.path.exists(tmp_dir):
        os.makedirs(tmp_dir)
        
    os.chdir(tmp_dir)
    
    # Log message
    log_msg = Command("log")
    log_msg.log(log_file=log_file,
                log_cmd=f"Input Timeseries: {os.path.basename(cii)}")
    [ log_msg.log(log_file=log_file, 
                 log_cmd=f"Processing CIFTI label file: {os.path.basename(label)}") for label in labels ]
    
    log_msg.log(log_file=log_file,
                log_cmd="Creating temporary directory")
    
    # convert subject data to NIFTI-1
    if verbose:
        print("Processing: Input Subject NIFTI-2 data")
        log_msg.log(log_file=log_file,
                log_cmd="Processing: Input Subject NIFTI-2 data")
        
    nii_sub = cifti_to_nifti(cii=cii,
                             out="sub_nii.ts.txt",
                             log_file=log_file,
                             debug=debug,
                             dryrun=dryrun,
                             env=env,
                             stdout="",
                             shell=shell)
    
    # Iterate through label/network/ROI files
    for idx in enumerate(labels):
        i = idx[0]
        cii_cluster = f"out.tmp.{str(i)}.cluster.dscalar.nii"
        nii_cluster = f"out.tmp.{str(i)}.cluster.nii.gz"
        ts_cluster = f"out.tmp.{str(i)}.ts.txt"
        out = os.path.join(out_dir,out_names[i] + ".mean_corr.txt")
        
        if verbose:
            print(f"Processing: {labels[i]}")
            log_msg.log(log_file=log_file,
                log_cmd=f"Processing: {labels[i]}")
        
        cii_cluster = find_cii_clusters(cii_file=labels[i],
                                        out_file=cii_cluster,
                                        left_surf=left_surf,
                                        right_surf=right_surf,
                                        thresh=thresh,
                                        min_size=min_size,
                                        log_file=log_file,
                                        debug=debug,
                                        dryrun=dryrun,
                                        env=env,
                                        stdout="",
                                        shell=shell)
        
        nii_cluster = cifti_to_nifti(cii=cii_cluster,
                                     out=nii_cluster,
                                     log_file=log_file,
                                     debug=debug,
                                     dryrun=dryrun,
                                     env=env,
                                     stdout="",
                                     shell=shell)
        
        ts_cluster = meants(nii=nii_sub,
                            out=ts_cluster,
                            label=nii_cluster,
                            log_file=log_file,
                            debug=debug,
                            dryrun=dryrun,
                            env=env,
                            stdout="",
                            shell=shell,
                            verbose=verbose)
        corr_mat = pearson_corr(file1=ts_cluster,log_file=log_file)
        out = write_arr(arr=np.mean(corr_mat),out_file=out)
        
    if len(labels) > 1:
        
        if verbose:
            print("Processing connectivity for all input labels")
            log_msg.log(log_file=log_file,
                log_cmd="Processing connectivity for all input labels")
            
        out = os.path.join(out_dir,"all_labels.mean_corr.txt")
        ts_list = []
        
        for idx in enumerate(labels):
            ts_cluster = f"out.tmp.{str(i)}.ts.txt"
            ts_mat = np.loadtxt(fname=ts_cluster)
            ts_list.append(ts_mat)
            
        ts_matrix = np.concatenate(ts_list,axis=1)
        corr_mat = pearson_corr(file1=ts_cluster,log_file=log_file)
        out = write_arr(arr=np.mean(corr_mat),out_file=out)
        
    # Clean-up
    os.chdir(cwd)
    log_msg.log(log_file=log_file,
                    log_cmd="Temporory directory and file clean-up")
    shutil.rmtree(tmp_dir)

if __name__ == "__main__":
    main()