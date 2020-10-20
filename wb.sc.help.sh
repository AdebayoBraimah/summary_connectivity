MERGE BORDER FILES
   wb_shortcuts -border-file-concatenate
      <output-border-file>
      <input-border-1>
      ...

      Additional input files may be specified after the mandatory input file.

MERGE MAPS OF CIFTI FILES
   wb_shortcuts -cifti-concatenate
      [-map <map-number-or-name>] - use only the specified map from each input
         file
      <output-cifti>
      <input-cifti-1>
      ...

      Additional input files may be specified after the mandatory input file.
      The -map option takes either a 1-based index or a map name, and causes
      the operation to use only one map from each input file.

DEMEAN/NORMALIZE AND CONCATENATE
   wb_shortcuts -cifti-demean
      [-normalize] - also normalize input files
      <output-cifti>
      <input-cifti-1>
      ...

      Demeans each input file (optionally normalizes by stdev) and then
      concatenates them.  Additional input files may be specified after the
      mandatory input file.

SEPARATE SURFACE LABELS INTO LEFT/RIGHT
   wb_shortcuts -cifti-dlabel-split-cortex
      <dlabel-in> - input dlabel file
      <dlabel-out> - output - output dlabel file

      For every label represented on left or right cortex, rename it with a
      prefix of 'L_' or 'R_', and change the label values as needed to keep
      the new names separate.

SEARCH WB_COMMAND HELP
   wb_shortcuts -command-help-search
      [-also-deprecated] - also search deprecated commands
      <search-string> - grep pattern to search for

      Searches for wb_command processing commands that contain the pattern.

CREATE MIDTHICKNESSES FROM FREESURFER
   wb_shortcuts -freesurfer-resample-prep
      <fs-white> - the freesurfer white surface
      <fs-pial> - the freesurfer pial surface
      <current-freesurfer-sphere>
      <new-sphere>
      <midthickness-current-out> - output - the midthickness on the current
         freesurfer mesh, in gifti format
      <midthickness-new-out> - output - likewise, on the new mesh
      <current-gifti-sphere-out> - output - the freesurfer sphere converted to
         gifti, must end in '.surf.gii'

      NOTE: freesurfer's mris_convert must be installed and in the $PATH in
      order to use this function, for converting the surfaces to GIFTI format.

      Generate the various surface files used for resampling individual data
      from FreeSurfer to fs_LR.  This generates the gifti-format sphere, and
      both midthickness surfaces needed by the -area-surfs option of wb_command
      -metric-resample, -label-resample, and similar commands.

CONVERT ROI TRACKS TO CIFTI
   wb_shortcuts -import-probtrack-roi
      <input-text> - the text file from probtrackx2
      <cifti-roi> - the ROI used as the seed mask, as cifti
      <output-cifti> - output - the data converted to cifti dscalar

      The <cifti-roi> file should contain the ROI used as the mask, and should
      be in the desired brainordinate space.

MERGE MAPS OF LABEL FILES
   wb_shortcuts -label-concatenate
      [-map <map-number-or-name>] - use only the specified map from each input
         file
      <output-label>
      <input-label-1>
      ...

      Additional input files may be specified after the mandatory input file.
      The -map option takes either a 1-based index or a map name, and causes
      the operation to use only one map from each input file.

MERGE MAPS OF METRIC FILES
   wb_shortcuts -metric-concatenate
      [-map <map-number-or-name>] - use only the specified map from each input
         file
      <output-metric>
      <input-metric-1>
      ...

      Additional input files may be specified after the mandatory input file.
      The -map option takes either a 1-based index or a map name, and causes
      the operation to use only one map from each input file.

MERGE SCENES OF SCENE FILES
   wb_shortcuts -scene-file-concatenate
      <output-scene-file>
      <input-scene-file-1>
      ...

      Additional input files may be specified after the mandatory input file.

MERGE MAPS OF VOLUME FILES
   wb_shortcuts -volume-concatenate
      [-map <map-number-or-name>] - use only the specified map from each input
         file
      <output-volume>
      <input-volume-1>
      ...

      Additional input files may be specified after the mandatory input file.
      The -map option takes either a 1-based index or a map name, and causes
      the operation to use only one map from each input file.

