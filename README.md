# summary_connectivity

Computes a summary connectivity score by computing the Pearson correlation within a given network or a set of ROIs (in the same CIFTI file), and then reports the mean of the lower triangular of the correlation (covariance) matrix (offset by -1 to remove the main diagonal).

NOTE: `Python` environmental issues may arise. If so, try this: 
* `export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${FSLDIR}/fslpython/envs/fslpython/lib`.

```
usage: summary_connectivity.py [-h] -i CIFTI.dtseries.nii -l LEFT.gii -r
                               RIGHT.gii -n CIFTI.dscalar.nii -o <prefix>
                               [-t FLOAT] [-m INT] [-log LOG] [--debug]
                               [--dry-run] [-v]

Computes the mean of the Pearson correlation coefficient within a given number
of networks/ROIs within a CIFTI dscalar or dlabel file. Additionally, should
more than one network be provided, then the Pearson correlation is computed
between them as well. Arguments labeled as `Repeatable` can be used more than
once, however, additional repeatable arguments must have the same number of
corresponding arguments.

optional arguments:
  -h, --help            show this help message and exit

Required arguments:
  -i CIFTI.dtseries.nii, -in CIFTI.dtseries.nii, --input CIFTI.dtseries.nii
                        CIFTI-2 dense timeseries file (e.g. subject's fMRI
                        timeseries mapped to some surface).
  -l LEFT.gii, --left-surface LEFT.gii
                        Left GIFTI surface (preferably midthickness file).
  -r RIGHT.gii, --right-surface RIGHT.gii
                        Right GIFTI surface (preferably midthickness file).
  -n CIFTI.dscalar.nii, --network CIFTI.dscalar.nii
                        Input dscalar or dlabel files [Repeatable].
  -o <prefix>, -out <prefix>, --output-prefix <prefix>
                        Output prefixes for corresponding input network/label
                        files. [Repeatable]

Optional arguments:
  -t FLOAT, -thresh FLOAT, --thresh FLOAT
                        Surface cluster threshold. [default: 1]
  -m INT, --min-size INT
                        Volume cluster threshold. [default: 20]
  -log LOG, --log-file LOG
                        Log file name. [default: 'log_file.log']
  --debug               Enables printing of diagnostic messages. [default:
                        'disabled']
  --dry-run             Preforms dry-run (e.g. no files are created).
                        [default: 'disabled']
  -v, --verbose         Enables printing of verbose messages. [default:
                        'disabled']```
