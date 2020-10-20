-add-to-spec-file
ADD A FILE TO A SPECIFICATION FILE
   wb_command -add-to-spec-file
      <specfile> - the specification file to add to
      <structure> - the structure of the data file
      <filename> - the path to the file

      The resulting spec file overwrites the existing spec file.  If the spec
      file doesn't exist, it is created with default metadata.  The structure
      argument must be one of the following:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-backend-average-dense-roi
CONNECTOME DB BACKEND COMMAND FOR CIFTI AVERAGE DENSE ROI
   wb_command -backend-average-dense-roi
      <index-list> - comma separated list of cifti indexes to average
      <out-file> - file to write the average row to

      This command is probably not the one you are looking for, try
      -cifti-average-dense-roi.  It takes the list of cifti files to average
      from standard input, and writes its output as little endian, 32-bit
      integer of row size followed by the row as 32-bit floats.


-backend-average-roi-correlation
CONNECTOME DB BACKEND COMMAND FOR CIFTI AVERAGE ROI CORRELATION
   wb_command -backend-average-roi-correlation
      <index-list> - comma separated list of cifti indexes to average and then
         correlate
      <out-file> - file to write the average row to

      This command is probably not the one you are looking for, try
      -cifti-average-roi-correlation.  It takes the list of cifti files to
      average from standard input, and writes its output as little endian,
      32-bit integer of row size followed by the row as 32-bit floats.


-border-export-color-table
WRITE BORDER NAMES AND COLORS AS TEXT
   wb_command -border-export-color-table
      <border-file> - the input border file
      <table-out> - output - the output text file

      [-class-colors] - use class colors instead of the name colors

      Takes the names and colors of each border, and writes it to the same
      format as -metric-label-import expects.  By default, the borders are
      colored by border name, specify -class-colors to color them by class
      instead.  The key values start at 1 and follow the order of the borders
      in the file.


-border-file-export-to-caret5
EXPORT BORDER FILE TO CARET5 FILE FORMAT
   wb_command -border-file-export-to-caret5
      <border-file> - workbench border file
      <output-file-prefix> - prefix for name of output caret5
         border/borderproj/bordercolor files

      [-surface] - repeatable - specify an input surface
         <surface-in> - a surface file for unprojection of borders

      A Workbench border file may contain borders for multiple structures and
      borders that are both projected and unprojected.  It also contains a
      color table for the borders. 

      Caret5 has both border (unprojected) and border projection (projected)
      files.  In addition, each Caret5 border or border projection file
      typically contains data for a single structure. Caret5 also uses a border
      color file that associates colors with the names of the borders. 

      This command will try to output both Caret5 border and border projection
      files.  Each output border/border projection file will contains data for
      one structure so there may be many files created.  The structure name is
      included in the name of each border or border projection file that is
      created. 

      One Caret5 border color file will also be produced by this command. 

      Providing surface(s) as input parameters is optional, but recommended.
      Surfaces may be needed to create both projected and/or unprojected
      coordinates of borders.  If there is a failure to produce an output
      border or border projection due to a missing surface with the matching
      structure, an error message will be displayed and some output files will
      not be created. 

      When writing new files, this command will overwrite a file with the same
      name. 


-border-length
REPORT LENGTH OF BORDERS
   wb_command -border-length
      <border> - the input border file
      <surface> - the surface to measure the borders on

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      [-separate-pieces] - report lengths for multi-part borders as separate
         numbers

      [-hide-border-name] - don't print border name before each output

      For each border, print its length along the surface, in mm.  If a border
      has multiple parts, their lengths are summed before printing, unless
      -separate-pieces is specified.

      The -corrected-areas option is intended for when the length is not
      meaningfully measurable on individual surfaces, it is only an approximate
      correction for the reduction in structure of a group average surface.


-border-merge
MERGE BORDER FILES INTO A NEW FILE
   wb_command -border-merge
      <border-file-out> - output - the output border file

      [-border] - repeatable - specify an input border file
         <border-file-in> - a border file to use borders from

         [-select] - repeatable - select a single border to use
            <border> - the border number or name

            [-up-to] - use an inclusive range of borders
               <last-border> - the number or name of the last column to include

               [-reverse] - use the range in reverse order

      Takes one or more border files and makes a new border file from the
      borders in them.

      Example: wb_command -border-merge out.border -border first.border -select
      1 -border second.border

      This example would take the first border from first.border, followed by
      all borders from second.border, and write these to out.border.


-border-resample
RESAMPLE A BORDER FILE TO A DIFFERENT MESH
   wb_command -border-resample
      <border-in> - the border file to resample
      <current-sphere> - a sphere surface with the mesh that the metric is
         currently on
      <new-sphere> - a sphere surface that is in register with <current-sphere>
         and has the desired output mesh
      <border-out> - output - the output border file

      Resamples a border file, given two spherical surfaces that are in
      register.  Only borders that have the same structure as current-sphere
      will be resampled.


-border-to-rois
MAKE METRIC ROIS FROM BORDERS
   wb_command -border-to-rois
      <surface> - the surface the borders are drawn on
      <border-file> - the border file
      <metric-out> - output - the output metric file

      [-border] - create ROI for only one border
         <name> - the name of the border

      [-inverse] - use inverse selection (outside border)

      [-include-border] - include vertices the border is closest to

      By default, draws ROIs inside all borders in the border file, as separate
      metric columns.


-border-to-vertices
DRAW BORDERS AS VERTICES IN A METRIC FILE
   wb_command -border-to-vertices
      <surface> - the surface the borders are drawn on
      <border-file> - the border file
      <metric-out> - output - the output metric file

      [-border] - create ROI for only one border
         <name> - the name of the border

      Outputs a metric with 1s on vertices that follow a border, and 0s
      elsewhere.  By default, a separate metric column is created for each
      border.


-cifti-all-labels-to-rois
MAKE ROIS FROM ALL LABELS IN A CIFTI LABEL MAP
   wb_command -cifti-all-labels-to-rois
      <label-in> - the input cifti label file
      <map> - the number or name of the label map to use
      <cifti-out> - output - the output cifti file

      The output cifti file is a dscalar file with a column (map) for each
      label in the specified input map, other than the ??? label, each of which
      contains a binary ROI of all brainordinates that are set to the
      corresponding label.

      Most of the time, specifying '1' for the <map> argument will do what is
      desired.


-cifti-average
AVERAGE CIFTI FILES
   wb_command -cifti-average
      <cifti-out> - output - output cifti file

      [-exclude-outliers] - exclude outliers by standard deviation of each
         element across files
         <sigma-below> - number of standard deviations below the mean to
            include
         <sigma-above> - number of standard deviations above the mean to
            include

      [-cifti] - repeatable - specify an input file
         <cifti-in> - the input cifti file

         [-weight] - give a weight for this file
            <weight> - the weight to use

      Averages cifti files together.  Files without -weight specified are given
      a weight of 1.  If -exclude-outliers is specified, at each element, the
      data across all files is taken as a set, its unweighted mean and sample
      standard deviation are found, and values outside the specified number of
      standard deviations are excluded from the (potentially weighted) average
      at that element.


-cifti-average-dense-roi
AVERAGE CIFTI ROWS ACROSS SUBJECTS BY ROI
   wb_command -cifti-average-dense-roi
      <cifti-out> - output - output cifti dscalar file

      [-cifti-roi] - cifti file containing combined weights
         <roi-cifti> - the roi cifti file

         [-in-memory] - cache the roi in memory so that it isn't re-read for
            each input cifti

      [-left-roi] - weights to use for left hempsphere
         <roi-metric> - the left roi as a metric file

      [-right-roi] - weights to use for right hempsphere
         <roi-metric> - the right roi as a metric file

      [-cerebellum-roi] - weights to use for cerebellum surface
         <roi-metric> - the cerebellum roi as a metric file

      [-vol-roi] - voxel weights to use
         <roi-vol> - the roi volume file

      [-left-area-surf] - specify the left surface for vertex area correction
         <left-surf> - the left surface file

      [-right-area-surf] - specify the right surface for vertex area correction
         <right-surf> - the right surface file

      [-cerebellum-area-surf] - specify the cerebellum surface for vertex area
         correction
         <cerebellum-surf> - the cerebellum surface file

      [-cifti] - repeatable - specify an input cifti file
         <cifti-in> - a cifti file to average across

      Averages rows for each map of the ROI(s), across all files.  ROI maps are
      treated as weighting functions, including negative values.  For
      efficiency, ensure that everything that is not intended to be used is
      zero in the ROI map.  If -cifti-roi is specified, -left-roi, -right-roi,
      -cerebellum-roi, and -vol-roi must not be specified.  If multiple
      non-cifti ROI files are specified, they must have the same number of
      columns.


-cifti-average-roi-correlation
CORRELATE ROI AVERAGE WITH ALL ROWS THEN AVERAGE ACROSS SUBJECTS
   wb_command -cifti-average-roi-correlation
      <cifti-out> - output - output cifti file

      [-cifti-roi] - cifti file containing combined weights
         <roi-cifti> - the roi cifti file

         [-in-memory] - cache the roi in memory so that it isn't re-read for
            each input cifti

      [-left-roi] - weights to use for left hempsphere
         <roi-metric> - the left roi as a metric file

      [-right-roi] - weights to use for right hempsphere
         <roi-metric> - the right roi as a metric file

      [-cerebellum-roi] - weights to use for cerebellum surface
         <roi-metric> - the cerebellum roi as a metric file

      [-vol-roi] - voxel weights to use
         <roi-vol> - the roi volume file

      [-left-area-surf] - specify the left surface for vertex area correction
         <left-surf> - the left surface file

      [-right-area-surf] - specify the right surface for vertex area correction
         <right-surf> - the right surface file

      [-cerebellum-area-surf] - specify the cerebellum surface for vertex area
         correction
         <cerebellum-surf> - the cerebellum surface file

      [-cifti] - repeatable - specify an input cifti file
         <cifti-in> - a cifti file to average across

      Averages rows for each map of the ROI(s), takes the correlation of each
      ROI average to the rest of the rows in the same file, then averages the
      results across all files.  ROIs are always treated as weighting
      functions, including negative values.  For efficiency, ensure that
      everything that is not intended to be used is zero in the ROI map.  If
      -cifti-roi is specified, -left-roi, -right-roi, -cerebellum-roi, and
      -vol-roi must not be specified.  If multiple non-cifti ROI files are
      specified, they must have the same number of columns.


-cifti-change-mapping
CONVERT TO SCALAR, COPY MAPPING, ETC
   wb_command -cifti-change-mapping
      <data-cifti> - the cifti file to use the data from
      <direction> - which direction on <data-cifti> to replace the mapping
      <cifti-out> - output - the output cifti file

      [-series] - set the mapping to series
         <step> - increment between series points
         <start> - start value of the series

         [-unit] - select unit for series (default SECOND)
            <unit> - unit identifier

      [-scalar] - set the mapping to scalar

         [-name-file] - specify names for the maps
            <file> - text file containing map names, one per line

      [-from-cifti] - copy mapping from another cifti file
         <template-cifti> - a cifti file containing the desired mapping
         <direction> - which direction to copy the mapping from

      Take an existing cifti file and change one of the mappings.  Exactly one
      of -series, -scalar, or -from-cifti must be specified.  The direction can
      be either an integer starting from 1, or the strings 'ROW' or 'COLUMN'.

      The argument to -unit must be one of the following:

      SECOND
      HERTZ
      METER
      RADIAN


-cifti-convert
DUMP CIFTI MATRIX INTO OTHER FORMATS
   wb_command -cifti-convert

      [-to-gifti-ext] - convert to GIFTI external binary
         <cifti-in> - the input cifti file
         <gifti-out> - output - the output gifti file

      [-from-gifti-ext] - convert a GIFTI made with this command back into a
         CIFTI
         <gifti-in> - the input gifti file
         <cifti-out> - output - the output cifti file

         [-reset-timepoints] - reset the mapping along rows to timepoints,
            taking length from the gifti file
            <timestep> - the desired time between frames
            <timestart> - the desired time offset of the initial frame

            [-unit] - use a unit other than time
               <unit> - unit identifier (default SECOND)

         [-reset-scalars] - reset mapping along rows to scalars, taking length
            from the gifti file

         [-replace-binary] - replace data with a binary file
            <binary-in> - the binary file that contains replacement data

            [-flip-endian] - byteswap the binary file

            [-transpose] - transpose the binary file

      [-to-nifti] - convert to NIFTI1
         <cifti-in> - the input cifti file
         <nifti-out> - output - the output nifti file

         [-smaller-file] - use better-fitting dimension lengths

         [-smaller-dims] - minimize the largest dimension, for tools that don't
            like large indices

      [-from-nifti] - convert a NIFTI (1 or 2) file made with this command back
         into CIFTI
         <nifti-in> - the input nifti file
         <cifti-template> - a cifti file with the dimension(s) and mapping(s)
            that should be used
         <cifti-out> - output - the output cifti file

         [-reset-timepoints] - reset the mapping along rows to timepoints,
            taking length from the nifti file
            <timestep> - the desired time between frames
            <timestart> - the desired time offset of the initial frame

            [-unit] - use a unit other than time
               <unit> - unit identifier (default SECOND)

         [-reset-scalars] - reset mapping along rows to scalars, taking length
            from the nifti file

      [-to-text] - convert to a plain text file
         <cifti-in> - the input cifti file
         <text-out> - output - the output text file

         [-col-delim] - choose string to put between elements in a row
            <delim-string> - the string to use (default is a tab character)

      [-from-text] - convert from plain text to cifti
         <text-in> - the input text file
         <cifti-template> - a cifti file with the dimension(s) and mapping(s)
            that should be used
         <cifti-out> - output - the output cifti file

         [-col-delim] - specify string that is between elements in a row
            <delim-string> - the string to use (default is any whitespace)

         [-reset-timepoints] - reset the mapping along rows to timepoints,
            taking length from the text file
            <timestep> - the desired time between frames
            <timestart> - the desired time offset of the initial frame

            [-unit] - use a unit other than time
               <unit> - unit identifier (default SECOND)

         [-reset-scalars] - reset mapping along rows to scalars, taking length
            from the text file

      This command is used to convert a full CIFTI matrix to/from formats that
      can be used by programs that don't understand CIFTI.  You must specify
      exactly one of -to-gifti-ext, -from-gifti-ext, -to-nifti, -from-nifti,
      -to-text, or -from-text.

      If you want to write an existing CIFTI file with a different CIFTI
      version, see -file-convert, and its -cifti-version-convert option.

      If you want part of the CIFTI file as a metric, label, or volume file,
      see -cifti-separate.  If you want to create a CIFTI file from metric
      and/or volume files, see the -cifti-create-* commands.

      If you want to import a matrix that is restricted to an ROI, first create
      a template CIFTI file matching that ROI using a -cifti-create-* command.
      After importing to CIFTI, you can then expand the file into a standard
      brainordinates space with -cifti-create-dense-from-template.  If you want
      to export only part of a CIFTI file, first create an roi-restricted CIFTI
      file with -cifti-restrict-dense-mapping.

      The -transpose option to -from-gifti-ext is needed if the replacement
      binary file is in column-major order.

      The -unit options accept these values:

      SECOND
      HERTZ
      METER
      RADIAN


-cifti-correlation
GENERATE CORRELATION OF ROWS IN A CIFTI FILE
   wb_command -cifti-correlation
      <cifti> - input cifti file
      <cifti-out> - output - output cifti file

      [-roi-override] - perform correlation from a subset of rows to all rows

         [-left-roi] - use an roi for left hempsphere
            <roi-metric> - the left roi as a metric file

         [-right-roi] - use an roi for right hempsphere
            <roi-metric> - the right roi as a metric file

         [-cerebellum-roi] - use an roi for cerebellum
            <roi-metric> - the cerebellum roi as a metric file

         [-vol-roi] - use an roi for volume
            <roi-vol> - the volume roi file

         [-cifti-roi] - use a cifti file for combined rois
            <roi-cifti> - the cifti roi file

      [-weights] - specify column weights
         <weight-file> - text file containing one weight per column

      [-fisher-z] - apply fisher small z transform (ie, artanh) to correlation

      [-no-demean] - instead of correlation, do dot product of rows, then
         normalize by diagonal

      [-covariance] - compute covariance instead of correlation

      [-mem-limit] - restrict memory usage
         <limit-GB> - memory limit in gigabytes

      For each row (or each row inside an roi if -roi-override is specified),
      correlate to all other rows.  The -cifti-roi suboption to -roi-override
      may not be specified with any other -*-roi suboption, but you may specify
      the other -*-roi suboptions together.

      When using the -fisher-z option, the output is NOT a Z-score, it is
      artanh(r), to do further math on this output, consider using -cifti-math.

      Restricting the memory usage will make it calculate the output in chunks,
      and if the input file size is more than 70% of the memory limit, it will
      also read through the input file as rows are required, resulting in
      several passes through the input file (once per chunk).  Memory limit
      does not need to be an integer, you may also specify 0 to calculate a
      single output row at a time (this may be very slow).


-cifti-correlation-gradient
CORRELATE CIFTI ROWS AND TAKE GRADIENT
   wb_command -cifti-correlation-gradient
      <cifti> - the input cifti
      <cifti-out> - output - the output cifti

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-left-corrected-areas] - vertex areas to use instead of computing
            them from the left surface
            <area-metric> - the corrected vertex areas, as a metric

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-right-corrected-areas] - vertex areas to use instead of computing
            them from the right surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-cerebellum-corrected-areas] - vertex areas to use instead of
            computing them from the cerebellum surface
            <area-metric> - the corrected vertex areas, as a metric

      [-surface-presmooth] - smooth on the surface before computing the
         gradient
         <surface-kernel> - the sigma for the gaussian surface smoothing
            kernel, in mm

      [-volume-presmooth] - smooth the volume before computing the gradient
         <volume-kernel> - the sigma for the gaussian volume smoothing kernel,
            in mm

      [-undo-fisher-z] - apply the inverse fisher small z transform to the
         input

      [-fisher-z] - apply the fisher small z transform to the correlations
         before taking the gradient

      [-surface-exclude] - exclude vertices near each seed vertex from
         computation
         <distance> - geodesic distance from seed vertex for the exclusion
            zone, in mm

      [-volume-exclude] - exclude voxels near each seed voxel from computation
         <distance> - distance from seed voxel for the exclusion zone, in mm

      [-covariance] - compute covariance instead of correlation

      [-mem-limit] - restrict memory usage
         <limit-GB> - memory limit in gigabytes

      For each structure, compute the correlation of the rows in the structure,
      and take the gradients of the resulting rows, then average them.  Memory
      limit does not need to be an integer, you may also specify 0 to use as
      little memory as possible (this may be very slow).


-cifti-create-dense-from-template
CREATE CIFTI WITH MATCHING DENSE MAP
   wb_command -cifti-create-dense-from-template
      <template-cifti> - file to match brainordinates of
      <cifti-out> - output - the output cifti file

      [-series] - make a dtseries file instead of a dscalar
         <step> - increment between series points
         <start> - start value of the series

         [-unit] - select unit for series (default SECOND)
            <unit> - unit identifier

      [-volume-all] - specify an input volume file for all voxel data
         <volume-in> - the input volume file

         [-from-cropped] - the input is cropped to the size of the voxel data
            in the template file

      [-cifti] - repeatable - use input data from a cifti file
         <cifti-in> - cifti file containing input data

      [-metric] - repeatable - use input data from a metric file
         <structure> - which structure to put the metric file into
         <metric-in> - input metric file

      [-label] - repeatable - use input data from surface label files
         <structure> - which structure to put the label file into
         <label-in> - input label file

      [-volume] - repeatable - use a volume file for a single volume
         structure's data
         <structure> - which structure to put the volume file into
         <volume-in> - the input volume file

         [-from-cropped] - the input is cropped to the size of the volume
            structure

      This command helps you make a new dscalar, dtseries, or dlabel cifti file
      that matches the brainordinate space used in another cifti file.  The
      template file must have the desired brainordinate space in the mapping
      along the column direction (for dtseries, dscalar, dlabel, and symmetric
      dconn this is always the case).  All input cifti files must have a brain
      models mapping along column and use the same volume space and/or surface
      vertex count as the template for structures that they contain.  If any
      input files contain label data, then input files with non-label data are
      not allowed, and the -series option may not be used.

      Any structure that isn't covered by an input is filled with zeros or the
      unlabeled key.

      The <structure> argument of -metric, -label or -volume must be one of the
      following:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT

      The argument to -unit must be one of the following:

      SECOND
      HERTZ
      METER
      RADIAN


-cifti-create-dense-scalar
CREATE A CIFTI DENSE SCALAR FILE
   wb_command -cifti-create-dense-scalar
      <cifti-out> - output - the output cifti file

      [-volume] - volume component
         <volume-data> - volume file containing all voxel data for all volume
            structures
         <structure-label-volume> - label volume file containing labels for
            cifti structures

      [-left-metric] - metric for left surface
         <metric> - the metric file

         [-roi-left] - roi of vertices to use from left surface
            <roi-metric> - the ROI as a metric file

      [-right-metric] - metric for left surface
         <metric> - the metric file

         [-roi-right] - roi of vertices to use from right surface
            <roi-metric> - the ROI as a metric file

      [-cerebellum-metric] - metric for the cerebellum
         <metric> - the metric file

         [-roi-cerebellum] - roi of vertices to use from right surface
            <roi-metric> - the ROI as a metric file

      [-name-file] - use a text file to set all map names
         <file> - text file containing map names, one per line

      All input files must have the same number of columns/subvolumes.  Only
      the specified components will be in the output cifti file.  Map names
      will be taken from one of the input files.  At least one component must
      be specified.

      See -volume-label-import and -volume-help for format details of label
      volume files.  The structure-label-volume should have some of the label
      names from this list, all other label names will be ignored:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-cifti-create-dense-timeseries
CREATE A CIFTI DENSE TIMESERIES
   wb_command -cifti-create-dense-timeseries
      <cifti-out> - output - the output cifti file

      [-volume] - volume component
         <volume-data> - volume file containing all voxel data for all volume
            structures
         <structure-label-volume> - label volume file containing labels for
            cifti structures

      [-left-metric] - metric for left surface
         <metric> - the metric file

         [-roi-left] - roi of vertices to use from left surface
            <roi-metric> - the ROI as a metric file

      [-right-metric] - metric for left surface
         <metric> - the metric file

         [-roi-right] - roi of vertices to use from right surface
            <roi-metric> - the ROI as a metric file

      [-cerebellum-metric] - metric for the cerebellum
         <metric> - the metric file

         [-roi-cerebellum] - roi of vertices to use from right surface
            <roi-metric> - the ROI as a metric file

      [-timestep] - set the timestep
         <interval> - the timestep, in seconds (default 1.0)

      [-timestart] - set the start time
         <start> - the time at the first frame, in seconds (default 0.0)

      [-unit] - use a unit other than time
         <unit> - unit identifier (default SECOND)

      All input files must have the same number of columns/subvolumes.  Only
      the specified components will be in the output cifti.  At least one
      component must be specified.

      See -volume-label-import and -volume-help for format details of label
      volume files.  The structure-label-volume should have some of the label
      names from this list, all other label names will be ignored:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT

      The -unit option accepts these values:

      SECOND
      HERTZ
      METER
      RADIAN


-cifti-create-label
CREATE A CIFTI LABEL FILE
   wb_command -cifti-create-label
      <cifti-out> - output - the output cifti file

      [-volume] - volume component
         <label-volume> - label volume file containing the data to be copied
         <structure-label-volume> - label volume file that defines which voxels
            to use

      [-left-label] - label file for left surface
         <label> - the label file

         [-roi-left] - roi of vertices to use from left surface
            <roi-metric> - the ROI as a metric file

      [-right-label] - label for left surface
         <label> - the label file

         [-roi-right] - roi of vertices to use from right surface
            <roi-metric> - the ROI as a metric file

      [-cerebellum-label] - label for the cerebellum
         <label> - the label file

         [-roi-cerebellum] - roi of vertices to use from right surface
            <roi-metric> - the ROI as a metric file

      All input files must have the same number of columns/subvolumes.  Only
      the specified components will be in the output cifti.  At least one
      component must be specified.

      The -volume option requires two volume arguments, the label-volume
      argument contains all labels you want to display (e.g. nuclei of the
      thalamus), whereas the structure-label-volume argument contains all CIFTI
      voxel-based structures you want to include data within (e.g.
      THALAMUS_LEFT, THALAMUS_RIGHT, etc).  See -volume-label-import and
      -volume-help for format details of label volume files.  If you just want
      the labels in voxels to be the structure names, you may use the same file
      for both arguments.  The structure-label-volume must use some of the
      label names from this list, all other label names in the
      structure-label-volume will be ignored:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-cifti-create-parcellated-from-template
MATCH PARCELS TO TEMPLATE BY NAME
   wb_command -cifti-create-parcellated-from-template
      <cifti-template> - a cifti file with the template parcel mapping along
         column
      <modify-direction> - which dimension of the output file should match the
         template (integer, 'ROW', or 'COLUMN')
      <cifti-out> - output - the output cifti file

      [-fill-value] - specify value to be used in parcels that don't match
         <value> - value to use (default 0)

      [-cifti] - repeatable - specify an input cifti file
         <cifti-in> - the input parcellated cifti file

      For each parcel name in the template mapping, find that name in an input
      cifti file and use its data in the output file.  All input cifti files
      must have a parcels mapping along <modify-direction> and matching
      mappings along other dimensions.  The direction can be either an integer
      starting from 1, or the strings 'ROW' or 'COLUMN'.


-cifti-create-scalar-series
IMPORT SERIES DATA INTO CIFTI
   wb_command -cifti-create-scalar-series
      <input> - input file
      <cifti-out> - output - output cifti file

      [-transpose] - use if the rows of the text file are along the scalar
         dimension

      [-name-file] - use a text file to set names on scalar dimension
         <file> - text file containing names, one per line

      [-series] - set the units and values of the series
         <unit> - the unit to use
         <start> - the value at the first series point
         <step> - the interval between series points

      Convert a text file containing series of equal length into a cifti file.
      The text file should have lines made up of numbers separated by
      whitespace, with no extra newlines between lines.

      The <unit> argument must be one of the following:

      SECOND
      HERTZ
      METER
      RADIAN


-cifti-cross-correlation
CORRELATE A CIFTI FILE WITH ANOTHER CIFTI FILE
   wb_command -cifti-cross-correlation
      <cifti-a> - first input cifti file
      <cifti-b> - second input cifti file
      <cifti-out> - output - output cifti file

      [-weights] - specify column weights
         <weight-file> - text file containing one weight per column

      [-fisher-z] - apply fisher small z transform (ie, artanh) to correlation

      [-mem-limit] - restrict memory usage
         <limit-GB> - memory limit in gigabytes

      Correlates every row in <cifti-a> with every row in <cifti-b>.  The
      mapping along columns in <cifti-b> becomes the mapping along rows in the
      output.

      When using the -fisher-z option, the output is NOT a Z-score, it is
      artanh(r), to do further math on this output, consider using -cifti-math.

      Restricting the memory usage will make it calculate the output in chunks,
      by reading through <cifti-b> multiple times.


-cifti-dilate
DILATE A CIFTI FILE
   wb_command -cifti-dilate
      <cifti-in> - the input cifti file
      <direction> - which dimension to dilate along, ROW or COLUMN
      <surface-distance> - the distance to dilate on surfaces, in mm
      <volume-distance> - the distance to dilate in the volume, in mm
      <cifti-out> - output - the output cifti file

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-left-corrected-areas] - vertex areas to use instead of computing
            them from the left surface
            <area-metric> - the corrected vertex areas, as a metric

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-right-corrected-areas] - vertex areas to use instead of computing
            them from the right surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-cerebellum-corrected-areas] - vertex areas to use instead of
            computing them from the cerebellum surface
            <area-metric> - the corrected vertex areas, as a metric

      [-bad-brainordinate-roi] - specify an roi of brainordinates to overwrite,
         rather than zeros
         <roi-cifti> - cifti dscalar or dtseries file, positive values denote
            brainordinates to have their values replaced

      [-nearest] - use nearest value

      [-merged-volume] - treat volume components as if they were a single
         component

      For all data values designated as bad, if they neighbor a good value or
      are within the specified distance of a good value in the same kind of
      model, replace the value with a distance weighted average of nearby good
      values, otherwise set the value to zero.  If -nearest is specified, it
      will use the value from the closest good value within range instead of a
      weighted average.  When the input file contains label data, nearest
      dilation is used on the surface, and weighted popularity is used in the
      volume.

      The -*-corrected-areas options are intended for dilating on group average
      surfaces, but it is only an approximate correction for the reduction of
      structure in a group average surface.

      If -bad-brainordinate-roi is specified, all values, including those with
      value zero, are good, except for locations with a positive value in the
      ROI.  If it is not specified, only values equal to zero are bad.


-cifti-erode
ERODE A CIFTI FILE
   wb_command -cifti-erode
      <cifti-in> - the input cifti file
      <direction> - which dimension to dilate along, ROW or COLUMN
      <surface-distance> - the distance to dilate on surfaces, in mm
      <volume-distance> - the distance to dilate in the volume, in mm
      <cifti-out> - output - the output cifti file

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-left-corrected-areas] - vertex areas to use instead of computing
            them from the left surface
            <area-metric> - the corrected vertex areas, as a metric

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-right-corrected-areas] - vertex areas to use instead of computing
            them from the right surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-cerebellum-corrected-areas] - vertex areas to use instead of
            computing them from the cerebellum surface
            <area-metric> - the corrected vertex areas, as a metric

      [-merged-volume] - treat volume components as if they were a single
         component

      For all data values that are empty (for label data, unlabeled, for other
      data, zero), set the surrounding values to empty.  The surrounding values
      are defined as the immediate neighbors and all values in the same
      structure within the specified distance (-merged-volume treats all voxels
      as one structure).

      The -*-corrected-areas options are intended for eroding on group average
      surfaces, but it is only an approximate correction.


-cifti-estimate-fwhm
ESTIMATE FWHM SMOOTHNESS OF A CIFTI FILE
   wb_command -cifti-estimate-fwhm
      <cifti> - the input cifti file

      [-merged-volume] - treat volume components as if they were a single
         component

      [-column] - only output estimates for one column
         <column> - the column number

      [-whole-file] - estimate for the whole file at once, not each column
         separately

         [-demean] - subtract the mean image before estimating smoothness

      [-surface] - repeatable - specify an input surface
         <structure> - what structure to use this surface for
         <surface> - the surface file

      Estimate the smoothness of the components of the cifti file, printing the
      estimates to standard output.  If -merged-volume is used, all voxels are
      used as a single component, rather than separated by structure.

      <structure> must be one of the following:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-cifti-export-dense-mapping
WRITE INDEX TO ELEMENT MAPPING AS TEXT
   wb_command -cifti-export-dense-mapping
      <cifti> - the cifti file
      <direction> - which direction to export the mapping from, ROW or COLUMN

      [-volume-all] - export the the mapping of all voxels
         <text-out> - output - the output text file

         [-no-cifti-index] - don't write the cifti index in the output file

         [-structure] - write the structure each voxel belongs to in the output
            file

      [-surface] - repeatable - export the the mapping of one surface structure
         <structure> - the structure to output
         <text-out> - output - the output text file

         [-no-cifti-index] - don't write the cifti index in the output file

      [-volume] - repeatable - export the the mapping of one volume structure
         <structure> - the structure to output
         <text-out> - output - the output text file

         [-no-cifti-index] - don't write the cifti index in the output file

      This command produces text files that describe the mapping from cifti
      indices to surface vertices or voxels.  All indices are zero-based.  The
      default format for -surface is lines of the form:

      <cifti-index> <vertex>

      The default format for -volume and -volume-all is lines of the form:

      <cifti-index> <i> <j> <k>

      For each <structure> argument, use one of the following strings:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-cifti-extrema
FIND EXTREMA IN A CIFTI FILE
   wb_command -cifti-extrema
      <cifti> - the input cifti
      <surface-distance> - the minimum distance between extrema of the same
         type, for surface components
      <volume-distance> - the minimum distance between extrema of the same
         type, for volume components
      <direction> - which dimension to find extrema along, ROW or COLUMN
      <cifti-out> - output - the output cifti

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

      [-surface-presmooth] - smooth on the surface before finding extrema
         <surface-kernel> - the sigma for the gaussian surface smoothing
            kernel, in mm

      [-volume-presmooth] - smooth volume components before finding extrema
         <volume-kernel> - the sigma for the gaussian volume smoothing kernel,
            in mm

      [-threshold] - ignore small extrema
         <low> - the largest value to consider for being a minimum
         <high> - the smallest value to consider for being a maximum

      [-merged-volume] - treat volume components as if they were a single
         component

      [-sum-maps] - output the sum of the extrema maps instead of each map
         separately

      [-consolidate-mode] - use consolidation of local minima instead of a
         large neighborhood

      [-only-maxima] - only find the maxima

      [-only-minima] - only find the minima

      Finds spatial locations in a cifti file that have more extreme values
      than all nearby locations in the same component (surface or volume
      structure).  The input cifti file must have a brain models mapping along
      the specified direction.  COLUMN is the direction that works on dtseries
      and dscalar.  For dconn, if it is symmetric use COLUMN, otherwise use
      ROW.


-cifti-false-correlation
COMPARE CORRELATION LOCALLY AND ACROSS/THROUGH SULCI/GYRI
   wb_command -cifti-false-correlation
      <cifti-in> - the cifti file to use for correlation
      <3D-dist> - maximum 3D distance to check around each vertex
      <geo-outer> - maximum geodesic distance to use for neighboring
         correlation
      <geo-inner> - minimum geodesic distance to use for neighboring
         correlation
      <cifti-out> - output - the output cifti dscalar file

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-dump-text] - dump the raw measures used to a text file
            <text-out> - the output text file

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-dump-text] - dump the raw measures used to a text file
            <text-out> - the output text file

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-dump-text] - dump the raw measures used to a text file
            <text-out> - the output text file

      For each vertex, compute the average correlation within a range of
      geodesic distances that don't cross a sulcus/gyrus, and the correlation
      to the closest vertex crossing a sulcus/gyrus.  A vertex is considered to
      cross a sulcus/gyrus if the 3D distance is less than a third of the
      geodesic distance.  The output file contains the ratio between these
      correlations, and some additional maps to help explain the ratio.


-cifti-find-clusters
FILTER CLUSTERS BY AREA/VOLUME
   wb_command -cifti-find-clusters
      <cifti> - the input cifti
      <surface-value-threshold> - threshold for surface data values
      <surface-minimum-area> - threshold for surface cluster area, in mm^2
      <volume-value-threshold> - threshold for volume data values
      <volume-minimum-size> - threshold for volume cluster size, in mm^3
      <direction> - which dimension to use for spatial information, ROW or
         COLUMN
      <cifti-out> - output - the output cifti

      [-less-than] - find values less than <value-threshold>, rather than
         greater

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-corrected-areas] - vertex areas to use instead of computing them
            from the surface
            <area-metric> - the corrected vertex areas, as a metric

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-corrected-areas] - vertex areas to use instead of computing them
            from the surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-corrected-areas] - vertex areas to use instead of computing them
            from the surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cifti-roi] - search only within regions of interest
         <roi-cifti> - the regions to search within, as a cifti file

      [-merged-volume] - treat volume components as if they were a single
         component

      [-size-ratio] - ignore clusters smaller than a given fraction of the
         largest cluster in the structure
         <surface-ratio> - fraction of the structure's largest cluster area
         <volume-ratio> - fraction of the structure's largest cluster volume

      [-distance] - ignore clusters further than a given distance from the
         largest cluster in the structure
         <surface-distance> - how far from the largest cluster a cluster can
            be, edge to edge, in mm
         <volume-distance> - how far from the largest cluster a cluster can be,
            edge to edge, in mm

      [-start] - start labeling clusters from a value other than 1
         <startval> - the value to give the first cluster found

      Outputs a cifti file with nonzero integers for all brainordinates within
      a large enough cluster, and zeros elsewhere.  The integers denote cluster
      membership (by default, first cluster found will use value 1, second
      cluster 2, etc).  The input cifti file must have a brain models mapping
      on the chosen dimension, columns for .dtseries, and either for .dconn.
      The ROI should have a brain models mapping along columns, exactly
      matching the mapping of the chosen direction in the input file.  Data
      outside the ROI is ignored.


-cifti-gradient
TAKE GRADIENT OF A CIFTI FILE
   wb_command -cifti-gradient
      <cifti> - the input cifti
      <direction> - which dimension to take the gradient along, ROW or COLUMN
      <cifti-out> - output - the output cifti

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-left-corrected-areas] - vertex areas to use instead of computing
            them from the left surface
            <area-metric> - the corrected vertex areas, as a metric

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-right-corrected-areas] - vertex areas to use instead of computing
            them from the right surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-cerebellum-corrected-areas] - vertex areas to use instead of
            computing them from the cerebellum surface
            <area-metric> - the corrected vertex areas, as a metric

      [-surface-presmooth] - smooth on the surface before computing the
         gradient
         <surface-kernel> - the sigma for the gaussian surface smoothing
            kernel, in mm

      [-volume-presmooth] - smooth on the surface before computing the gradient
         <volume-kernel> - the sigma for the gaussian volume smoothing kernel,
            in mm

      [-average-output] - output the average of the gradient magnitude maps
         instead of each gradient map separately

      [-vectors] - output gradient vectors
         <vectors-out> - output - the vectors, as a dscalar file

      Performs gradient calculation on each component of the cifti file, and
      optionally averages the resulting gradients.  The -vectors and
      -average-output options may not be used together.  You must specify a
      surface for each surface structure in the cifti file.  The COLUMN
      direction should be faster, and is the direction that works on dtseries.
      For dconn, you probably want ROW, unless you are using -average-output.


-cifti-label-adjacency
MAKE ADJACENCY MATRIX OF A CIFTI LABEL FILE
   wb_command -cifti-label-adjacency
      <label-in> - the input cifti label file
      <adjacency-out> - output - the output cifti pconn adjacency matrix

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

      Find face-adjacent voxels and connected vertices that have different
      label values, and count them for each pair.  Put the resulting counts
      into a parcellated connectivity file, with the diagonal being zero.  This
      gives a rough estimate of how long or expansive the border between two
      labels is.


-cifti-label-export-table
EXPORT LABEL TABLE FROM CIFTI AS TEXT
   wb_command -cifti-label-export-table
      <label-in> - the input cifti label file
      <map> - the number or name of the label map to use
      <table-out> - output - the output text file

      Takes the label table from the cifti label map, and writes it to a text
      format matching what is expected by -cifti-label-import.


-cifti-label-import
MAKE A CIFTI LABEL FILE FROM A CIFTI FILE
   wb_command -cifti-label-import
      <input> - the input cifti file
      <label-list-file> - text file containing the values and names for labels
      <output> - output - the output cifti label file

      [-discard-others] - set any values not mentioned in the label list to the
         ??? label

      [-unlabeled-value] - set the value that will be interpreted as unlabeled
         <value> - the numeric value for unlabeled (default 0)

      [-drop-unused-labels] - remove any unused label values from the label
         table

      Creates a cifti label file from a cifti file with label-like values.  You
      may specify the empty string ('' will work on linux/mac) for
      <label-list-file>, which will be treated as if it is an empty file.  It
      is assumed that a value of 0 in the input file means "unlabeled", unless
      -unlabeled-value is specified.  Do not specify the "unlabeled" label in
      the text file.

      The label list file must have the following format (2 lines per label):

      <labelname>
      <key> <red> <green> <blue> <alpha>
      ...

      Label names are specified on a separate line from their value and color,
      in order to let label names contain spaces.  Whitespace is trimmed from
      both ends of the label name, but is kept if it is in the middle of a
      label.  The value of <key> specifies what value in the imported file
      should be used as this label.  The values of <red>, <green>, <blue> and
      <alpha> must be integers from 0 to 255, and will specify the color the
      label is drawn as (alpha of 255 means fully opaque, which is probably
      what you want).

      By default, it will create new label names with names like LABEL_5 for
      any values encountered that are not mentioned in the list file, specify
      -discard-others to instead set these values to the "unlabeled" key.


-cifti-label-probability
FIND FREQUENCY OF CIFTI LABELS
   wb_command -cifti-label-probability
      <label-maps> - cifti dlabel file containing individual label maps from
         many subjects
      <probability-dscalar-out> - output - the relative frequencies of each
         label at each vertex/voxel

      [-exclude-unlabeled] - don't make a probability map of the unlabeled key

      This command outputs a set of soft ROIs, one for each label in the input,
      where the value is how many of the input maps had that label at that
      vertex/voxel, divided by the number of input maps.


-cifti-label-to-border
DRAW BORDERS AROUND CIFTI LABELS
   wb_command -cifti-label-to-border
      <cifti-in> - the input cifti dlabel file

      [-placement] - set how far along the edge border points are drawn
         <fraction> - fraction along edge from inside vertex (default 0.33)

      [-column] - select a single column
         <column> - the column number or name

      [-border] - repeatable - specify output file for a surface structure
         <surface> - the surface to use for neighbor and structure information
         <border-out> - output - the output border file

      For each surface, takes the labels on the matching structure and draws
      borders around the labels.  Use -column to only draw borders around one
      label map.


-cifti-label-to-roi
MAKE A CIFTI LABEL INTO AN ROI
   wb_command -cifti-label-to-roi
      <label-in> - the input cifti label file
      <scalar-out> - output - the output cifti scalar file

      [-name] - select label by name
         <label-name> - the label name that you want an roi of

      [-key] - select label by key
         <label-key> - the label key that you want an roi of

      [-map] - select a single label map to use
         <map> - the map number or name

      For each map in <label-in>, a map is created in <scalar-out> where all
      locations labeled with <label-name> or with a key of <label-key> are
      given a value of 1, and all other locations are given 0.  Exactly one of
      -name and -key must be specified.  Specify -map to use only one map from
      <label-in>.


-cifti-math
EVALUATE EXPRESSION ON CIFTI FILES
   wb_command -cifti-math
      <expression> - the expression to evaluate, in quotes
      <cifti-out> - output - the output cifti file

      [-fixnan] - replace NaN results with a value
         <replace> - value to replace NaN with

      [-override-mapping-check] - don't check the mappings for compatibility,
         only check length

      [-var] - repeatable - a cifti file to use as a variable
         <name> - the name of the variable, as used in the expression
         <cifti> - the cifti file to use as this variable

         [-select] - repeatable - select a single index from a dimension
            <dim> - the dimension to select from (1-based)
            <index> - the index to use (1-based)

            [-repeat] - repeat the selected values for each index of output in
               this dimension

      This command evaluates <expression> at each matrix element independently.
      There must be at least one -var option (to get the output layout from),
      even if the <name> specified in it isn't used in <expression>.

      To select a single column from a 2D file (most cifti files are 2D), use
      -select 1 <index>, where <index> is 1-based.  To select a single row from
      a 2D file, use -select 2 <index>.  Where -select is not used, the cifti
      files must have compatible mappings (e.g., brain models and parcels
      mappings must match exactly except for parcel names).  Use
      -override-mapping-check to skip this checking.

      Filenames are not valid in <expression>, use a variable name and a -var
      option with matching <name> to specify an input file.  The format of
      <expression> is as follows:

      Expressions consist of constants, variables, operators, parentheses, and
      functions, in infix notation, such as 'exp(-x + 3) * scale'.  Variables
      are strings of any length, using the characters a-z, A-Z, 0-9, and _, but
      may not take the name of a named constant.  Currently, there is only one
      named constant, PI.  The operators are +, -, *, /, ^, >, <, >=, <=, ==,
      !=, !, &&, ||.  These behave as in C, except that ^ is exponentiation,
      i.e. pow(x, y), and takes higher precedence than other binary operators
      (also, '-3^-4^-5' means '-(3^(-(4^-5)))').  The <=, >=, ==, and !=
      operators are given a small amount of wiggle room, equal to one millionth
      of the smaller of the absolute values of the values being compared.

      Comparison and logical operators return 0 or 1, you can do masking with
      expressions like 'x * (mask > 0)'.  For all logical operators, an input
      is considered true iff it is greater than 0.  The expression '0 < x < 5'
      is not syntactically wrong, but it will NOT do what is desired, because
      it is evaluated left to right, i.e. '((0 < x) < 5)', which will always
      return 1, as both possible results of a comparison are less than 5.  A
      warning is generated if an expression of this type is detected.  Use
      something like 'x > 0 && x < 5' to get the desired behavior.

      Whitespace between elements is ignored, ' sin ( 2 * x ) ' is equivalent
      to 'sin(2*x)', but 's in(2*x)' is an error.  Implied multiplication is
      not allowed, the expression '2x' will be parsed as a variable.
      Parentheses are (), do not use [] or {}.  Functions require parentheses,
      the expression 'sin x' is an error.

      The following functions are supported:

         sin: 1 argument, the sine of the argument (units are radians)
         cos: 1 argument, the cosine of the argument (units are radians)
         tan: 1 argument, the tangent of the argument (units are radians)
         asin: 1 argument, the inverse of sine of the argument, in radians
         acos: 1 argument, the inverse of cosine of the argument, in radians
         atan: 1 argument, the inverse of tangent of the argument, in radians
         atan2: 2 arguments, atan2(y, x) returns the inverse of tangent of
      (y/x), in radians, determining quadrant by the sign of both arguments
         sinh: 1 argument, the hyperbolic sine of the argument
         cosh: 1 argument, the hyperbolic cosine of the argument
         tanh: 1 argument, the hyperboloc tangent of the argument
         asinh: 1 argument, the inverse hyperbolic sine of the argument
         acosh: 1 argument, the inverse hyperbolic cosine of the argument
         atanh: 1 argument, the inverse hyperboloc tangent of the argument
         ln: 1 argument, the natural logarithm of the argument
         exp: 1 argument, the constant e raised to the power of the argument
         log: 1 argument, the base 10 logarithm of the argument
         sqrt: 1 argument, the square root of the argument
         abs: 1 argument, the absolute value of the argument
         floor: 1 argument, the largest integer not greater than the argument
         round: 1 argument, the nearest integer, with ties rounded away from
      zero
         ceil: 1 argument, the smallest integer not less than the argument
         min: 2 arguments, min(x, y) returns y if (x > y), x otherwise
         max: 2 arguments, max(x, y) returns y if (x < y), x otherwise
         mod: 2 arguments, mod(x, y) = x - y * floor(x / y), or 0 if y == 0
         clamp: 3 arguments, clamp(x, low, high) = min(max(x, low), high)


-cifti-merge
MERGE CIFTI TIMESERIES, SCALAR, OR LABEL FILES
   wb_command -cifti-merge
      <cifti-out> - output - output cifti file

      [-cifti] - repeatable - specify an input cifti file
         <cifti-in> - a cifti file to use columns from

         [-column] - repeatable - select a single column to use
            <column> - the column number (starting from 1) or name

            [-up-to] - use an inclusive range of columns
               <last-column> - the number or name of the last column to include

               [-reverse] - use the range in reverse order

      Given input CIFTI files which have matching mappings along columns, and
      for which mappings along rows are the same type, all either series,
      scalars, or labels, this command concatenates the specified columns
      horizontally (rows become longer).

      Example: wb_command -cifti-merge out.dtseries.nii -cifti
      first.dtseries.nii -column 1 -cifti second.dtseries.nii

      This example would take the first column from first.dtseries.nii,
      followed by all columns from second.dtseries.nii, and write these columns
      to out.dtseries.nii.


-cifti-merge-dense
MERGE CIFTI FILES ALONG DENSE DIMENSION
   wb_command -cifti-merge-dense
      <direction> - which dimension to merge along, ROW or COLUMN
      <cifti-out> - output - the output cifti file

      [-cifti] - repeatable - specify an input cifti file
         <cifti-in> - a cifti file to merge

      The input cifti files must have matching mappings along the direction not
      specified, and the mapping along the specified direction must be brain
      models.


-cifti-merge-parcels
MERGE CIFTI FILES ALONG PARCELS DIMENSION
   wb_command -cifti-merge-parcels
      <direction> - which dimension to merge along (integer, 'ROW', or
         'COLUMN')
      <cifti-out> - output - the output cifti file

      [-cifti] - repeatable - specify an input cifti file
         <cifti-in> - a cifti file to merge

      The input cifti files must have matching mappings along the direction not
      specified, and the mapping along the specified direction must be parcels.
      The direction can be either an integer starting from 1, or the strings
      'ROW' or 'COLUMN'.


-cifti-pairwise-correlation
CORRELATE PAIRED ROWS BETWEEN TWO CIFTI FILES
   wb_command -cifti-pairwise-correlation
      <cifti-a> - first input cifti file
      <cifti-b> - second input cifti file
      <cifti-out> - output - output cifti file

      [-fisher-z] - apply fisher small z transform (ie, artanh) to correlation

      [-override-mapping-check] - don't check the mappings for compatibility,
         only check length

      For each row in <cifti-a>, correlate it with the same row in <cifti-b>,
      and put the result in the same row of <cifti-out>, which has only one
      column.


-cifti-palette
SET PALETTE ON A CIFTI FILE
   wb_command -cifti-palette
      <cifti-in> - the cifti input
      <mode> - the mapping mode
      <cifti-out> - output - the output cifti file

      [-column] - select a single column for scalar maps
         <column> - the column number or name

      [-pos-percent] - percentage min/max for positive data coloring
         <pos-min-%> - the percentile for the least positive data
         <pos-max-%> - the percentile for the most positive data

      [-neg-percent] - percentage min/max for negative data coloring
         <neg-min-%> - the percentile for the least negative data
         <neg-max-%> - the percentile for the most negative data

      [-pos-user] - user min/max values for positive data coloring
         <pos-min-user> - the value for the least positive data
         <pos-max-user> - the value for the most positive data

      [-neg-user] - user min/max values for negative data coloring
         <neg-min-user> - the value for the least negative data
         <neg-max-user> - the value for the most negative data

      [-interpolate] - interpolate colors
         <interpolate> - boolean, whether to interpolate

      [-disp-pos] - display positive data
         <display> - boolean, whether to display

      [-disp-neg] - display positive data
         <display> - boolean, whether to display

      [-disp-zero] - display data closer to zero than the min cutoff
         <display> - boolean, whether to display

      [-palette-name] - set the palette used
         <name> - the name of the palette

      [-thresholding] - set the thresholding
         <type> - thresholding setting
         <test> - show values inside or outside thresholds
         <min> - lower threshold
         <max> - upper threshold

      [-inversion] - specify palette inversion
         <type> - the type of inversion

      NOTE: The output file must be a different file than the input file.

      For scalar maps, by default the palette is changed for every map, specify
      -column to change only one map.  Palette settings not specified will be
      taken from the first column for scalar maps, and from the existing file
      palette for other mapping types.  The <mode> argument must be one of the
      following:

      MODE_AUTO_SCALE
      MODE_AUTO_SCALE_ABSOLUTE_PERCENTAGE
      MODE_AUTO_SCALE_PERCENTAGE
      MODE_USER_SCALE

      The <name> argument to -palette-name must be one of the following:

      ROY-BIG-BL
      videen_style
      Gray_Interp_Positive
      Gray_Interp
      PSYCH-FIXED
      RBGYR20
      RBGYR20P
      RYGBR4_positive
      RGRBR_mirror90_pos
      Orange-Yellow
      POS_NEG_ZERO
      red-yellow
      blue-lightblue
      FSL
      power_surf
      fsl_red
      fsl_green
      fsl_blue
      fsl_yellow
      RedWhiteBlue
      cool-warm
      spectral
      RY-BC-BL
      magma
      JET256
      PSYCH
      PSYCH-NO-NONE
      ROY-BIG
      clear_brain
      fidl
      raich4_clrmid
      raich6_clrmid
      HSB8_clrmid
      POS_NEG

      The <type> argument to -thresholding must be one of the following:

      THRESHOLD_TYPE_OFF
      THRESHOLD_TYPE_NORMAL
      THRESHOLD_TYPE_FILE

      The <test> argument to -thresholding must be one of the following:

      THRESHOLD_TEST_SHOW_OUTSIDE
      THRESHOLD_TEST_SHOW_INSIDE

      The <type> argument to -inversion must be one of the following:

      OFF
      POSITIVE_WITH_NEGATIVE
      POSITIVE_NEGATIVE_SEPARATE


-cifti-parcel-mapping-to-label
CREATE DLABEL FROM PARCELLATED FILE
   wb_command -cifti-parcel-mapping-to-label
      <cifti-in> - the input parcellated file
      <direction> - which dimension to take the parcel map from, ROW or COLUMN
      <template-cifti> - a cifti file with the desired dense mapping along
         column
      <dlabel-out> - output - the output dense label file

      This command will output a dlabel file, useful for doing the same
      parcellation to another dense file.

      For ptseries, pscalar, plabel, pconn, and pdconn, using COLUMN for
      <direction> will work.


-cifti-parcellate
PARCELLATE A CIFTI FILE
   wb_command -cifti-parcellate
      <cifti-in> - the cifti file to parcellate
      <cifti-label> - a cifti label file to use for the parcellation
      <direction> - which mapping to parcellate (integer, ROW, or COLUMN)
      <cifti-out> - output - output cifti file

      [-spatial-weights] - use voxel volume and either vertex areas or metric
         files as weights

         [-left-area-surf] - use a surface for left vertex areas
            <left-surf> - the left surface to use, areas are in mm^2

         [-right-area-surf] - use a surface for right vertex areas
            <right-surf> - the right surface to use, areas are in mm^2

         [-cerebellum-area-surf] - use a surface for cerebellum vertex areas
            <cerebellum-surf> - the cerebellum surface to use, areas are in
               mm^2

         [-left-area-metric] - use a metric file for left vertex weights
            <left-metric> - metric file containing left vertex weights

         [-right-area-metric] - use a metric file for right vertex weights
            <right-metric> - metric file containing right vertex weights

         [-cerebellum-area-metric] - use a metric file for cerebellum vertex
            weights
            <cerebellum-metric> - metric file containing cerebellum vertex
               weights

      [-cifti-weights] - use a cifti file containing weights
         <weight-cifti> - the weights to use, as a cifti file

      [-method] - specify method of parcellation (default MEAN, or MODE if
         label data)
         <method> - the method to use to assign parcel values from the values
            of member brainordinates

      [-exclude-outliers] - exclude non-numeric values and outliers from each
         parcel by standard deviation
         <sigma-below> - number of standard deviations below the mean to
            include
         <sigma-above> - number of standard deviations above the mean to
            include

      [-only-numeric] - exclude non-numeric values

      [-include-empty] - create parcels for labels that have no vertices or
         voxels

         [-fill-value] - specify value to use in empty parcels (default 0)
            <value> - the value to fill empty parcels with

         [-nonempty-mask-out] - output a matching pscalar file that has 0s in
            empty parcels, and 1s elsewhere
            <mask-out> - output - the output mask file

      Each non-empty label (other than the unlabeled key) in the cifti label
      file will be treated as a parcel, and all rows or columns within the
      parcel are averaged together to form the output row or column.  If
      -include-empty is specified, empty labels will be treated as parcels with
      no elements, and filled with a constant value.  The direction can be
      either an integer starting from 1, or the strings 'ROW' or 'COLUMN'.  For
      dtseries or dscalar, use COLUMN.  If you are parcellating a dconn in both
      directions, parcellating by ROW first will use much less memory.

      The parameter to the -method option must be one of the following:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data

      The -*-weights options are mutually exclusive and may only be used with
      MEAN, SUM, STDEV, SAMPSTDEV, VARIANCE, MEDIAN, or MODE.


-cifti-reduce
PERFORM REDUCTION OPERATION ON A CIFTI FILE
   wb_command -cifti-reduce
      <cifti-in> - the cifti file to reduce
      <operation> - the reduction operator to use
      <cifti-out> - output - the output cifti file

      [-direction] - specify what direction to reduce along
         <direction> - the direction (default ROW)

      [-exclude-outliers] - exclude non-numeric values and outliers by standard
         deviation
         <sigma-below> - number of standard deviations below the mean to
            include
         <sigma-above> - number of standard deviations above the mean to
            include

      [-only-numeric] - exclude non-numeric values

      For the specified direction (default ROW), perform a reduction operation
      along that direction.  The direction can be either an integer starting
      from 1, or the strings 'ROW' or 'COLUMN'.  The reduction operators are as
      follows:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data


-cifti-reorder
REORDER THE PARCELS OR SCALAR/LABEL MAPS IN A CIFTI FILE
   wb_command -cifti-reorder
      <cifti-in> - input cifti file
      <direction> - which dimension to reorder along, ROW or COLUMN
      <reorder-list> - a text file containing the desired order transformation
      <cifti-out> - output - the reordered cifti file

      The mapping along the specified direction must be parcels, scalars, or
      labels.  For pscalar or ptseries, use COLUMN to reorder the parcels.  For
      dlabel, use ROW.  The <reorder-list> file must contain 1-based indices
      separated by whitespace (spaces, newlines, tabs, etc), with as many
      indices as <cifti-in> has along the specified dimension.  These indices
      specify which current index should end up in that position, for instance,
      if the current order is 'A B C D', and the desired order is 'D A B C',
      the text file should contain '4 1 2 3'.


-cifti-replace-structure
REPLACE DATA IN A STRUCTURE IN A CIFTI FILE
   wb_command -cifti-replace-structure
      <cifti> - the cifti to modify
      <direction> - which dimension to interpret as a single map, ROW or COLUMN

      [-volume-all] - replace the data in all volume components
         <volume> - the input volume

         [-from-cropped] - the input is cropped to the size of the data

      [-discard-unused-labels] - when operating on a dlabel file, drop any
         unused label keys from the label table

      [-label] - repeatable - replace the data in a surface label component
         <structure> - the structure to replace the data of
         <label> - the input label file

      [-metric] - repeatable - replace the data in a surface component
         <structure> - the structure to replace the data of
         <metric> - the input metric

      [-volume] - repeatable - replace the data in a volume component
         <structure> - the structure to replace the data of
         <volume> - the input volume

         [-from-cropped] - the input is cropped to the size of the component

      You must specify at least one of -metric, -label, -volume, or -volume-all
      for this command to do anything.  Input volumes must line up with the
      output of -cifti-separate.  For dtseries/dscalar, use COLUMN, and if your
      matrix will be fully symmetric, COLUMN is more efficient.  The structure
      argument must be one of the following:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-cifti-resample
RESAMPLE A CIFTI FILE TO A NEW CIFTI SPACE
   wb_command -cifti-resample
      <cifti-in> - the cifti file to resample
      <direction> - the direction of the input that should be resampled, ROW or
         COLUMN
      <cifti-template> - a cifti file containing the cifti space to resample to
      <template-direction> - the direction of the template to use as the
         resampling space, ROW or COLUMN
      <surface-method> - specify a surface resampling method
      <volume-method> - specify a volume interpolation method
      <cifti-out> - output - the output cifti file

      [-surface-largest] - use largest weight instead of weighted average or
         popularity when doing surface resampling

      [-volume-predilate] - dilate the volume components before resampling
         <dilate-mm> - distance, in mm, to dilate

         [-nearest] - use nearest value dilation

         [-weighted] - use weighted dilation (default)

            [-exponent] - specify exponent in weighting function
               <exponent> - exponent 'n' to use in (1 / (distance ^ n)) as the
                  weighting function (default 2)

      [-surface-postdilate] - dilate the surface components after resampling
         <dilate-mm> - distance, in mm, to dilate

         [-nearest] - use nearest value dilation

         [-linear] - use linear dilation

         [-weighted] - use weighted dilation (default for non-label data)

            [-exponent] - specify exponent in weighting function
               <exponent> - exponent 'n' to use in (area / (distance ^ n)) as
                  the weighting function (default 2)

      [-affine] - use an affine transformation on the volume components
         <affine-file> - the affine file to use

         [-flirt] - MUST be used if affine is a flirt affine
            <source-volume> - the source volume used when generating the affine
            <target-volume> - the target volume used when generating the affine

      [-warpfield] - use a warpfield on the volume components
         <warpfield> - the warpfield to use

         [-fnirt] - MUST be used if using a fnirt warpfield
            <source-volume> - the source volume used when generating the
               warpfield

      [-left-spheres] - specify spheres for left surface resampling
         <current-sphere> - a sphere with the same mesh as the current left
            surface
         <new-sphere> - a sphere with the new left mesh that is in register
            with the current sphere

         [-left-area-surfs] - specify left surfaces to do vertex area
            correction based on
            <current-area> - a relevant left anatomical surface with current
               mesh
            <new-area> - a relevant left anatomical surface with new mesh

         [-left-area-metrics] - specify left vertex area metrics to do area
            correction based on
            <current-area> - a metric file with vertex areas for the current
               mesh
            <new-area> - a metric file with vertex areas for the new mesh

      [-right-spheres] - specify spheres for right surface resampling
         <current-sphere> - a sphere with the same mesh as the current right
            surface
         <new-sphere> - a sphere with the new right mesh that is in register
            with the current sphere

         [-right-area-surfs] - specify right surfaces to do vertex area
            correction based on
            <current-area> - a relevant right anatomical surface with current
               mesh
            <new-area> - a relevant right anatomical surface with new mesh

         [-right-area-metrics] - specify right vertex area metrics to do area
            correction based on
            <current-area> - a metric file with vertex areas for the current
               mesh
            <new-area> - a metric file with vertex areas for the new mesh

      [-cerebellum-spheres] - specify spheres for cerebellum surface resampling
         <current-sphere> - a sphere with the same mesh as the current
            cerebellum surface
         <new-sphere> - a sphere with the new cerebellum mesh that is in
            register with the current sphere

         [-cerebellum-area-surfs] - specify cerebellum surfaces to do vertex
            area correction based on
            <current-area> - a relevant cerebellum anatomical surface with
               current mesh
            <new-area> - a relevant cerebellum anatomical surface with new mesh

         [-cerebellum-area-metrics] - specify cerebellum vertex area metrics to
            do area correction based on
            <current-area> - a metric file with vertex areas for the current
               mesh
            <new-area> - a metric file with vertex areas for the new mesh

      Resample cifti data to a different brainordinate space.  Use COLUMN for
      the direction to resample dscalar, dlabel, or dtseries.  Resampling both
      dimensions of a dconn requires running this command twice, once with
      COLUMN and once with ROW.  If you are resampling a dconn and your machine
      has a large amount of memory, you might consider using
      -cifti-resample-dconn-memory to avoid writing and rereading an
      intermediate file.  The <template-direction> argument should usually be
      COLUMN, as dtseries, dscalar, and dlabel all have brainordinates on that
      direction.  If spheres are not specified for a surface structure which
      exists in the cifti files, its data is copied without resampling or
      dilation.  Dilation is done with the 'nearest' method, and is done on
      <new-sphere> for surface data.  Volume components are padded before
      dilation so that dilation doesn't run into the edge of the component
      bounding box.  If neither -affine nor -warpfield are specified, the
      identity transform is assumed for the volume data.

      The recommended resampling methods are ADAP_BARY_AREA and CUBIC (cubic
      spline), except for label data which should use ADAP_BARY_AREA and
      ENCLOSING_VOXEL.  Using ADAP_BARY_AREA requires specifying an area option
      to each used -*-spheres option.

      The <volume-method> argument must be one of the following:

      CUBIC
      ENCLOSING_VOXEL
      TRILINEAR

      The <surface-method> argument must be one of the following:

      ADAP_BARY_AREA
      BARYCENTRIC


-cifti-resample-dconn-memory
USE LOTS OF MEMORY TO RESAMPLE DCONN
   wb_command -cifti-resample-dconn-memory
      <cifti-in> - the cifti file to resample
      <cifti-template> - a cifti file containing the cifti space to resample to
      <template-direction> - the direction of the template to use as the
         resampling space, ROW or COLUMN
      <surface-method> - specify a surface resampling method
      <volume-method> - specify a volume interpolation method
      <cifti-out> - output - the output cifti file

      [-surface-largest] - use largest weight instead of weighted average when
         doing surface resampling

      [-volume-predilate] - dilate the volume components before resampling
         <dilate-mm> - distance, in mm, to dilate

         [-nearest] - use nearest value dilation

         [-weighted] - use weighted dilation

            [-exponent] - specify exponent in weighting function
               <exponent> - exponent 'n' to use in (1 / (distance ^ n)) as the
                  weighting function (default 2)

      [-surface-postdilate] - dilate the surface components after resampling
         <dilate-mm> - distance, in mm, to dilate

         [-nearest] - use nearest value dilation

         [-linear] - use linear dilation

         [-weighted] - use weighted dilation

            [-exponent] - specify exponent in weighting function
               <exponent> - exponent 'n' to use in (area / (distance ^ n)) as
                  the weighting function (default 2)

      [-affine] - use an affine transformation on the volume components
         <affine-file> - the affine file to use

         [-flirt] - MUST be used if affine is a flirt affine
            <source-volume> - the source volume used when generating the affine
            <target-volume> - the target volume used when generating the affine

      [-warpfield] - use a warpfield on the volume components
         <warpfield> - the warpfield to use

         [-fnirt] - MUST be used if using a fnirt warpfield
            <source-volume> - the source volume used when generating the
               warpfield

      [-left-spheres] - specify spheres for left surface resampling
         <current-sphere> - a sphere with the same mesh as the current left
            surface
         <new-sphere> - a sphere with the new left mesh that is in register
            with the current sphere

         [-left-area-surfs] - specify left surfaces to do vertex area
            correction based on
            <current-area> - a relevant left anatomical surface with current
               mesh
            <new-area> - a relevant left anatomical surface with new mesh

         [-left-area-metrics] - specify left vertex area metrics to do area
            correction based on
            <current-area> - a metric file with vertex areas for the current
               mesh
            <new-area> - a metric file with vertex areas for the new mesh

      [-right-spheres] - specify spheres for right surface resampling
         <current-sphere> - a sphere with the same mesh as the current right
            surface
         <new-sphere> - a sphere with the new right mesh that is in register
            with the current sphere

         [-right-area-surfs] - specify right surfaces to do vertex area
            correction based on
            <current-area> - a relevant right anatomical surface with current
               mesh
            <new-area> - a relevant right anatomical surface with new mesh

         [-right-area-metrics] - specify right vertex area metrics to do area
            correction based on
            <current-area> - a metric file with vertex areas for the current
               mesh
            <new-area> - a metric file with vertex areas for the new mesh

      [-cerebellum-spheres] - specify spheres for cerebellum surface resampling
         <current-sphere> - a sphere with the same mesh as the current
            cerebellum surface
         <new-sphere> - a sphere with the new cerebellum mesh that is in
            register with the current sphere

         [-cerebellum-area-surfs] - specify cerebellum surfaces to do vertex
            area correction based on
            <current-area> - a relevant cerebellum anatomical surface with
               current mesh
            <new-area> - a relevant cerebellum anatomical surface with new mesh

         [-cerebellum-area-metrics] - specify cerebellum vertex area metrics to
            do area correction based on
            <current-area> - a metric file with vertex areas for the current
               mesh
            <new-area> - a metric file with vertex areas for the new mesh

      This command does the same thing as running -cifti-resample twice, but
      uses memory up to approximately 2x the size that the intermediate file
      would be.  This is because the intermediate dconn is kept in memory,
      rather than written to disk, and the components before and after
      resampling/dilation have to be in memory at the same time during the
      relevant computation.  The <template-direction> argument should usually
      be COLUMN, as dtseries, dscalar, and dlabel all have brainordinates on
      that direction.  If spheres are not specified for a surface structure
      which exists in the cifti files, its data is copied without resampling or
      dilation.  Dilation is done with the 'nearest' method, and is done on
      <new-sphere> for surface data.  Volume components are padded before
      dilation so that dilation doesn't run into the edge of the component
      bounding box.

      The <volume-method> argument must be one of the following:

      CUBIC
      ENCLOSING_VOXEL
      TRILINEAR

      The <surface-method> argument must be one of the following:

      ADAP_BARY_AREA
      BARYCENTRIC


-cifti-restrict-dense-map
EXCLUDE BRAINORDINATES FROM A CIFTI FILE
   wb_command -cifti-restrict-dense-map
      <cifti-in> - the input cifti
      <direction> - which dimension to change the mapping on (integer, 'ROW',
         or 'COLUMN')
      <cifti-out> - output - the output cifti

      [-cifti-roi] - cifti file containing combined rois
         <roi-cifti> - the rois as a cifti file

      [-left-roi] - vertices to use from left hemisphere
         <roi-metric> - the left roi as a metric file

      [-right-roi] - vertices to use from right hemisphere
         <roi-metric> - the right roi as a metric file

      [-cerebellum-roi] - vertices to use from cerebellum
         <roi-metric> - the cerebellum roi as a metric file

      [-vol-roi] - voxels to use
         <roi-vol> - the roi volume file

      Writes a modified version of <cifti-in>, where all brainordinates outside
      the specified roi(s) are removed from the file.  The direction can be
      either an integer starting from 1, or the strings 'ROW' or 'COLUMN'.  If
      -cifti-roi is specified, no other -*-roi option may be specified.  If not
      using -cifti-roi, any -*-roi options not present will discard the
      relevant structure, if present in the input file.


-cifti-roi-average
AVERAGE ROWS IN A SINGLE CIFTI FILE
   wb_command -cifti-roi-average
      <cifti-in> - the cifti file to average rows from
      <text-out> - output text file of the average values

      [-cifti-roi] - cifti file containing combined rois
         <roi-cifti> - the rois as a cifti file

      [-left-roi] - vertices to use from left hemisphere
         <roi-metric> - the left roi as a metric file

      [-right-roi] - vertices to use from right hemisphere
         <roi-metric> - the right roi as a metric file

      [-cerebellum-roi] - vertices to use from cerebellum
         <roi-metric> - the cerebellum roi as a metric file

      [-vol-roi] - voxels to use
         <roi-vol> - the roi volume file

      Average the rows that are within the specified ROIs, and write the
      resulting average row to a text file, separated by newlines.  If
      -cifti-roi is specified, -left-roi, -right-roi, -cerebellum-roi, and
      -vol-roi must not be specified.


-cifti-rois-from-extrema
CREATE CIFTI ROI MAPS FROM EXTREMA MAPS
   wb_command -cifti-rois-from-extrema
      <cifti> - the input cifti
      <surf-limit> - geodesic distance limit from vertex, in mm
      <vol-limit> - euclidean distance limit from voxel center, in mm
      <direction> - which dimension an extrema map is along, ROW or COLUMN
      <cifti-out> - output - the output cifti

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

      [-gaussian] - generate gaussian kernels instead of flat ROIs
         <surf-sigma> - the sigma for the surface gaussian kernel, in mm
         <vol-sigma> - the sigma for the volume gaussian kernel, in mm

      [-overlap-logic] - how to handle overlapping ROIs, default ALLOW
         <method> - the method of resolving overlaps

      [-merged-volume] - treat volume components as if they were a single
         component

      For each nonzero value in each map, make a map with an ROI around that
      location.  If the -gaussian option is specified, then normalized gaussian
      kernels are output instead of ROIs.  The <method> argument to
      -overlap-logic must be one of ALLOW, CLOSEST, or EXCLUDE.  ALLOW is the
      default, and means that ROIs are treated independently and may overlap.
      CLOSEST means that ROIs may not overlap, and that no ROI contains
      vertices that are closer to a different seed vertex.  EXCLUDE means that
      ROIs may not overlap, and that any vertex within range of more than one
      ROI does not belong to any ROI.


-cifti-separate
WRITE A CIFTI STRUCTURE AS METRIC, LABEL OR VOLUME
   wb_command -cifti-separate
      <cifti-in> - the cifti to separate a component of
      <direction> - which direction to separate into components, ROW or COLUMN

      [-volume-all] - separate all volume structures into a volume file
         <volume-out> - output - the output volume

         [-roi] - also output the roi of which voxels have data
            <roi-out> - output - the roi output volume

         [-label] - output a volume label file indicating the location of
            structures
            <label-out> - output - the label output volume

         [-crop] - crop volume to the size of the data rather than using the
            original volume size

      [-label] - repeatable - separate a surface model into a surface label
         file
         <structure> - the structure to output
         <label-out> - output - the output label file

         [-roi] - also output the roi of which vertices have data
            <roi-out> - output - the roi output metric

      [-metric] - repeatable - separate a surface model into a metric file
         <structure> - the structure to output
         <metric-out> - output - the output metric

         [-roi] - also output the roi of which vertices have data
            <roi-out> - output - the roi output metric

      [-volume] - repeatable - separate a volume structure into a volume file
         <structure> - the structure to output
         <volume-out> - output - the output volume

         [-roi] - also output the roi of which voxels have data
            <roi-out> - output - the roi output volume

         [-crop] - crop volume to the size of the component rather than using
            the original volume size

      For dtseries, dscalar, and dlabel, use COLUMN for <direction>, and if you
      have a symmetric dconn, COLUMN is more efficient.

      You must specify at least one of -metric, -volume-all, -volume, or -label
      for this command to do anything.  Output volumes will spatially line up
      with their original positions, whether or not they are cropped.  Volume
      files produced by separating a dlabel file, or from the -label suboption
      of -volume-all, will be label volumes, see -volume-help.

      For each <structure> argument, use one of the following strings:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-cifti-smoothing
SMOOTH A CIFTI FILE
   wb_command -cifti-smoothing
      <cifti> - the input cifti
      <surface-kernel> - the sigma for the gaussian surface smoothing kernel,
         in mm
      <volume-kernel> - the sigma for the gaussian volume smoothing kernel, in
         mm
      <direction> - which dimension to smooth along, ROW or COLUMN
      <cifti-out> - output - the output cifti

      [-left-surface] - specify the left surface to use
         <surface> - the left surface file

         [-left-corrected-areas] - vertex areas to use instead of computing
            them from the left surface
            <area-metric> - the corrected vertex areas, as a metric

      [-right-surface] - specify the right surface to use
         <surface> - the right surface file

         [-right-corrected-areas] - vertex areas to use instead of computing
            them from the right surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cerebellum-surface] - specify the cerebellum surface to use
         <surface> - the cerebellum surface file

         [-cerebellum-corrected-areas] - vertex areas to use instead of
            computing them from the cerebellum surface
            <area-metric> - the corrected vertex areas, as a metric

      [-cifti-roi] - smooth only within regions of interest
         <roi-cifti> - the regions to smooth within, as a cifti file

      [-fix-zeros-volume] - treat values of zero in the volume as missing data

      [-fix-zeros-surface] - treat values of zero on the surface as missing
         data

      [-merged-volume] - smooth across subcortical structure boundaries

      The input cifti file must have a brain models mapping on the chosen
      dimension, columns for .dtseries, and either for .dconn.  By default,
      data in different structures is smoothed independently (i.e., "parcel
      constrained" smoothing), so volume structures that touch do not smooth
      across this boundary.  Specify -merged-volume to ignore these boundaries.
      Surface smoothing uses the GEO_GAUSS_AREA smoothing method.

      The -*-corrected-areas options are intended for when it is unavoidable to
      smooth on group average surfaces, it is only an approximate correction
      for the reduction of structure in a group average surface.  It is better
      to smooth the data on individuals before averaging, when feasible.

      The -fix-zeros-* options will treat values of zero as lack of data, and
      not use that value when generating the smoothed values, but will fill
      zeros with extrapolated values.  The ROI should have a brain models
      mapping along columns, exactly matching the mapping of the chosen
      direction in the input file.  Data outside the ROI is ignored.


-cifti-stats
STATISTICS ALONG CIFTI COLUMNS
   wb_command -cifti-stats
      <cifti-in> - the input cifti

      [-reduce] - use a reduction operation
         <operation> - the reduction operation

      [-percentile] - give the value at a percentile
         <percent> - the percentile to find

      [-column] - only display output for one column
         <column> - the column index (starting from 1)

      [-roi] - only consider data inside an roi
         <roi-cifti> - the roi, as a cifti file

         [-match-maps] - each column of input uses the corresponding column
            from the roi file

      [-show-map-name] - print column index and name before each output

      For each column of the input, a row of text is printed, resulting from
      the specified reduction or percentile operation.  If -roi is specified
      without -match-maps, then each row contains as many numbers as there are
      maps in the ROI file, separated by tab characters.  Use -column to only
      give output for a single data column.  Exactly one of -reduce or
      -percentile must be specified.

      The argument to the -reduce option must be one of the following:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data


-cifti-transpose
TRANSPOSE A CIFTI FILE
   wb_command -cifti-transpose
      <cifti-in> - the input cifti file
      <cifti-out> - output - the output cifti file

      [-mem-limit] - restrict memory usage
         <limit-GB> - memory limit in gigabytes

      The input must be a 2-dimensional cifti file.  The output is a cifti file
      where every row in the input is a column in the output.


-cifti-vector-operation
DO A VECTOR OPERATION ON CIFTI FILES
   wb_command -cifti-vector-operation
      <vectors-a> - first vector input file
      <vectors-b> - second vector input file
      <operation> - what vector operation to do
      <cifti-out> - output - the output file

      [-normalize-a] - normalize vectors of first input

      [-normalize-b] - normalize vectors of second input

      [-normalize-output] - normalize output vectors (not valid for dot
         product)

      [-magnitude] - output the magnitude of the result (not valid for dot
         product)

      Does a vector operation on two cifti files (that must have a multiple of
      3 columns).  Either of the inputs may have multiple vectors (more than 3
      columns), but not both (at least one must have exactly 3 columns).  The
      -magnitude and -normalize-output options may not be specified together,
      or with an operation that returns a scalar (dot product).  The
      <operation> parameter must be one of the following:

      DOT
      CROSS
      ADD
      SUBTRACT


-cifti-weighted-stats
WEIGHTED STATISTICS ALONG CIFTI COLUMNS
   wb_command -cifti-weighted-stats
      <cifti-in> - the input cifti

      [-spatial-weights] - use vertex area and voxel volume as weights

         [-left-area-surf] - use a surface for left vertex areas
            <left-surf> - the left surface to use, areas are in mm^2

         [-right-area-surf] - use a surface for right vertex areas
            <right-surf> - the right surface to use, areas are in mm^2

         [-cerebellum-area-surf] - use a surface for cerebellum vertex areas
            <cerebellum-surf> - the cerebellum surface to use, areas are in
               mm^2

         [-left-area-metric] - use a metric file for left vertex areas
            <left-metric> - metric file containing left vertex areas

         [-right-area-metric] - use a metric file for right vertex areas
            <right-metric> - metric file containing right vertex areas

         [-cerebellum-area-metric] - use a metric file for cerebellum vertex
            areas
            <cerebellum-metric> - metric file containing cerebellum vertex
               areas

      [-cifti-weights] - use a cifti file containing weights
         <weight-cifti> - the weights to use, as a cifti file

      [-column] - only display output for one column
         <column> - the column to use (1-based)

      [-roi] - only consider data inside an roi
         <roi-cifti> - the roi, as a cifti file

         [-match-maps] - each column of input uses the corresponding column
            from the roi file

      [-mean] - compute weighted mean

      [-stdev] - compute weighted standard deviation

         [-sample] - estimate population stdev from the sample

      [-percentile] - compute weighted percentile
         <percent> - the percentile to find

      [-sum] - compute weighted sum

      [-show-map-name] - print map index and name before each output

      If the mapping along column is brain models, for each column of the
      input, the specified operation is done on each surface and across all
      voxels, and the results are printed separately.  For other mapping types,
      the operation is done on each column, and one number per map is printed.
      Exactly one of -spatial-weights or -cifti-weights must be specified.  Use
      -column to only give output for a single column.  Use -roi to consider
      only the data within a region.  Exactly one of -mean, -stdev, -percentile
      or -sum must be specified.

      Using -sum with -spatial-weights (or with -cifti-weights and a cifti
      containing weights of similar meaning) is equivalent to integrating with
      respect to area and volume.  When the input is binary ROIs, this will
      therefore output the area or volume of each ROI.


-class-add-member

Add members to class header (.h) and implementation (.cxx) files.

Usage:  <class-name> 
        [-add-to-files]
        [-m <member-name> <data-type> <description>]...

    If the -add-to-files is not specified, the code for the
    header and implementation files is printed to the 
    terminal.

    If the -add-to-files is specified, the class files are
    expected to be in the current directory and named
    <class-name>.h and <class-name>.cxx.  The header 
    file must contain this text in its private section:
        // ADD_NEW_MEMBERS_HERE
    The implementation file must contain this text in
    its public section:
        // ADD_NEW_METHODS_HERE
    If either of these text string are missing, the code 
    that would have been added to the file(s) is printed
    to the terminal.
    
    For each member, three text strings separated by a space
    must be provided and they are the name of the member
    its data type, and a description of the member.  If the
    description contains spaces the description must be
    enclosed in double quotes ("").
    
    If the data type begins with a capital letter, it is
    assumed to be the name of a class.  In this case, both
    const and non-const getters are created but not setter
    is created.  Otherwise, the data type is expected to be
    a primitive type and both a getter and a setter are
    created.  Note that AString and QString are treated as
    primitive types.
    


-class-create

Create class header (.h) and implementation (.cxx) files.

Usage:  <class-name> 
        [-copy] 
        [-equal] 
        [-event-class <event-type-enum>]
        [-event-listener] 
        [-no-parent] 
        [-parent <parent-class-name>] 
        [-scene] 
        [-scene-sub-class] 


Options: 
    -copy
        Adds copy constructor and assignment operator
    
    -equal
        Adds equality operator.
    
    -event-class <event-type-enum>
        When creating an Event subclass, using this
        option will automatically set the parent
        class to Event and place the given event
        enumerated type value into the parameter
        for the Event class constructor.
        
        For the <event-type-enum> there is no need
        to prepend it with "EventTypeEnum::".
        
    -event-listener 
        Implement the EventListenerInterface so
        that the class may listen for events.
        
    -no-parent
        Created class is not derived from any other
        class.  By default, the parent class is
        CaretObject.
    
    -parent <parent-class-name>
        Specify the parent (derived from) class.
        By default, the parent class is CaretObject.
    
    -scene
        Implement the SceneableInterface so that 
        instances of the class can be restored from 
        and saved to scenes. 
    
    -scene-sub-class
        Adds methods that can be called by the super- 
        class so that this sub-class can save and 
        restore data to and from scenes.  
        
        This option should only be used when creating
        a class whose super class implements the 
        SceneableInterface
        


-class-create-algorithm

Create Algorithm Class header (.h) and implementation (.cxx) files.

Usage:  <algorithm-class-name>
        <command-line-switch>
        <short-description>

    algorithm-class-name
        Required name of the algorithm class that MUST start with "Algorithm"
    
    command-line-switch
        Required command line switch for algorithm.
    
    short-description
        Required short description within double quotes.
    


-class-create-enum

Create enumerated type header (.h) and implementation (.cxx) files.

Usage:  <enum-class-name>
        <number-of-values>
        <auto-number>

    enum-class-name
        Name of the enumerated type.  Must end in "Enum"
    
    number-of-values
        Number of values in the enumerated type.
    
    auto-number
        Automatically generated integer codes corresponding
        to the enumerated values.  Value for this parameter
        are "true" and "false".
    
    [enum-name-1] [enum-name-2]...[enum-name-N]
        Optional names for the enumerated values.  
        
        If the number of names listed is greater than
        the "number-of-values" parameter, the "number-of-values"
        will become the number of names.  If the number
        of names is is less than the "number-of-values",
        empty entries will be created.
        


-class-create-operation

Create Operation Class header (.h) and implementation (.cxx) files.

Usage:  <operation-class-name>
        <command-line-switch>
        <short-description>
        [-no-parameters]

    operation-class-name
        Required name of the operation class that MUST start with "Operation"
    
    command-line-switch
        Required command line switch for operation.
    
    short-description
        Required short description within double quotes.
    
    -no-parameters
        Optional parameter if the operation does not use parameters.
    


-convert-affine
CONVERT AN AFFINE FILE BETWEEN CONVENTIONS
   wb_command -convert-affine

      [-from-world] - input is a NIFTI 'world' affine
         <input> - the input affine

         [-inverse] - for files that use 'target to source' convention

      [-from-itk] - input is an ITK matrix
         <input> - the input affine

      [-from-flirt] - input is a flirt matrix
         <input> - the input affine
         <source-volume> - the source volume used when generating the input
            affine
         <target-volume> - the target volume used when generating the input
            affine

      [-to-world] - write output as a NIFTI 'world' affine
         <output> - output - the output affine

         [-inverse] - write file using 'target to source' convention

      [-to-itk] - write output as an ITK affine
         <output> - output - the output affine

      [-to-flirt] - repeatable - write output as a flirt matrix
         <output> - output - the output affine
         <source-volume> - the volume you want to apply the transform to
         <target-volume> - the target space you want the transformed volume to
            match

      NIFTI world matrices can be used directly on mm coordinates via matrix
      multiplication, they use the NIFTI coordinate system, that is, positive X
      is right, positive Y is anterior, and positive Z is superior.  Note that
      wb_command assumes that world matrices transform source coordinates to
      target coordinates, while other tools may use affines that transform
      target coordinates to source coordinates.

      The ITK format is used by ANTS.

      You must specify exactly one -from option, but you may specify multiple
      -to options, and -to-flirt may be specified more than once.


-convert-fiber-orientations
CONVERT BINGHAM PARAMETER VOLUMES TO FIBER ORIENTATION FILE
   wb_command -convert-fiber-orientations
      <label-volume> - volume of cifti structure labels
      <fiber-out> - output - the output fiber orientation file

      [-fiber] - repeatable - specify the parameter volumes for a fiber
         <mean-f> - mean fiber strength
         <stdev-f> - standard deviation of fiber strength
         <theta> - theta angle
         <phi> - phi angle
         <psi> - psi angle
         <ka> - ka bingham parameter
         <kb> - kb bingham parameter

      Takes precomputed bingham parameters from volume files and converts them
      to the format workbench uses for display.  The <label-volume> argument
      must be a label volume, where the labels use these strings:


      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-convert-matrix4-to-matrix2
GENERATES A MATRIX2 CIFTI FROM MATRIX4 WBSPARSE
   wb_command -convert-matrix4-to-matrix2
      <matrix4-wbsparse> - a wbsparse matrix4 file
      <counts-out> - output - the total fiber counts, as a cifti file

      [-distances] - output average trajectory distance
         <distance-out> - output - the distances, as a cifti file

      [-individual-fibers] - output files for each fiber direction
         <fiber-1> - output - output file for first fiber
         <fiber-2> - output - output file for second fiber
         <fiber-3> - output - output file for third fiber

      This command makes a cifti file from the fiber counts in a matrix4
      wbsparse file, and optionally a second cifti file from the distances.
      Note that while the total count is stored exactly, the per-fiber counts
      are stored as approximate fractions, so the output of -individual-fibers
      will contain nonintegers.


-convert-matrix4-to-workbench-sparse
CONVERT A 3-FILE MATRIX4 TO A WORKBENCH SPARSE FILE
   wb_command -convert-matrix4-to-workbench-sparse
      <matrix4_1> - the first matrix4 file
      <matrix4_2> - the second matrix4 file
      <matrix4_3> - the third matrix4 file
      <orientation-file> - the .fiberTEMP.nii file this trajectory file applies
         to
      <voxel-list> - list of white matter voxel index triplets as used in the
         trajectory matrix
      <wb-sparse-out> - output - the output workbench sparse file

      [-surface-seeds] - specify the surface seed space
         <seed-roi> - metric roi file of all vertices used in the seed space

      [-volume-seeds] - specify the volume seed space
         <cifti-template> - cifti file to use the volume mappings from
         <direction> - dimension along the cifti file to take the mapping from,
            ROW or COLUMN

      Converts the matrix 4 output of probtrackx to workbench sparse file
      format.  Exactly one of -surface-seeds and -volume-seeds must be
      specified.


-convert-warpfield
CONVERT A WARPFIELD BETWEEN CONVENTIONS
   wb_command -convert-warpfield

      [-from-world] - input is a NIFTI 'world' warpfield
         <input> - the input warpfield

      [-from-itk] - input is an ITK warpfield
         <input> - the input warpfield

      [-from-fnirt] - input is a fnirt warpfield
         <input> - the input warpfield
         <source-volume> - the source volume used when generating the input
            warpfield

         [-absolute] - warpfield was written in absolute convention, rather
            than relative

      [-to-world] - write output as a NIFTI 'world' warpfield
         <output> - output - the output warpfield

      [-to-itk] - write output as an ITK warpfield
         <output> - output - the output warpfield

      [-to-fnirt] - repeatable - write output as a fnirt warpfield
         <output> - output - the output warpfield
         <source-volume> - the volume you want to apply the warpfield to

      NIFTI world warpfields can be used directly on mm coordinates via
      sampling the three subvolumes at the coordinate and adding the sampled
      values to the coordinate vector.  They use the NIFTI coordinate system,
      that is, X is left to right, Y is posterior to anterior, and Z is
      inferior to superior.

      NOTE: this command does not invert the warpfield, and to warp a surface,
      you must use the inverse of the warpfield that warps the corresponding
      volume.

      The ITK format is used by ANTS.

      You must specify exactly one -from option, but you may specify multiple
      -to options, and -to-fnirt may be specified more than once.


-create-signed-distance-volume
CREATE SIGNED DISTANCE VOLUME FROM SURFACE
   wb_command -create-signed-distance-volume
      <surface> - the input surface
      <refspace> - a volume in the desired output space (dims, spacing, origin)
      <outvol> - output - the output volume

      [-roi-out] - output an roi volume of where the output has a computed
         value
         <roi-vol> - output - the output roi volume

      [-fill-value] - specify a value to put in all voxels that don't get
         assigned a distance
         <value> - value to fill with (default 0)

      [-exact-limit] - specify distance for exact output
         <dist> - distance in mm (default 5)

      [-approx-limit] - specify distance for approximate output
         <dist> - distance in mm (default 20)

      [-approx-neighborhood] - voxel neighborhood for approximate calculation
         <num> - size of neighborhood cube measured from center to face, in
            voxels (default 2 = 5x5x5)

      [-winding] - winding method for point inside surface test
         <method> - name of the method (default EVEN_ODD)

      Computes the signed distance function of the surface.  Exact distance is
      calculated by finding the closest point on any surface triangle to the
      center of the voxel.  Approximate distance is calculated starting with
      these distances, using dijkstra's method with a neighborhood of voxels.
      Specifying too small of an exact distance may produce unexpected results.
      Valid specifiers for winding methods are as follows:

      EVEN_ODD (default)
      NEGATIVE
      NONZERO
      NORMALS

      The NORMALS method uses the normals of triangles and edges, or the
      closest triangle hit by a ray from the point.  This method may be
      slightly faster, but is only reliable for a closed surface that does not
      cross through itself.  All other methods count entry (positive) and exit
      (negative) crossings of a vertical ray from the point, then counts as
      inside if the total is odd, negative, or nonzero, respectively.


-estimate-fiber-binghams
ESTIMATE FIBER ORIENTATION DISTRIBUTIONS FROM BEDPOSTX SAMPLES
   wb_command -estimate-fiber-binghams
      <merged_f1samples> - fiber 1 strength samples
      <merged_th1samples> - fiber 1 theta samples
      <merged_ph1samples> - fiber 1 phi samples
      <merged_f2samples> - fiber 2 strength samples
      <merged_th2samples> - fiber 2 theta samples
      <merged_ph2samples> - fiber 2 phi samples
      <merged_f3samples> - fiber 3 strength samples
      <merged_th3samples> - fiber 3 theta samples
      <merged_ph3samples> - fiber 3 phi samples
      <label-volume> - volume of cifti structure labels
      <cifti-out> - output - output cifti fiber distributons file

      This command does an estimation of a bingham distribution for each fiber
      orientation in each voxel which is labeled a structure identifier.  These
      labelings come from the <label-volume> argument, which must have labels
      that match the following strings:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-fiber-dot-products
COMPUTE DOT PRODUCTS OF FIBER ORIENTATIONS WITH SURFACE NORMALS
   wb_command -fiber-dot-products
      <white-surf> - the white/gray boundary surface
      <fiber-file> - the fiber orientation file
      <max-dist> - the maximum distance from any surface vertex a fiber
         population may be, in mm
      <direction> - test against surface for whether a fiber population should
         be used
      <dot-metric> - output - the metric of dot products
      <f-metric> - output - a metric of the f values of the fiber distributions

      For each vertex, this command finds the closest fiber population that
      satisfies the <direction> test, and computes the absolute value of the
      dot product of the surface normal and the normalized mean direction of
      each fiber.  The <direction> test must be one of INSIDE, OUTSIDE, or ANY,
      which causes the command to only use fiber populations that are inside
      the surface, outside the surface, or to not care which direction it is
      from the surface.  Each fiber population is output in a separate metric
      column.


-file-convert
CHANGE VERSION OF FILE FORMAT
   wb_command -file-convert

      [-border-version-convert] - write a border file with a different version
         <border-in> - the input border file
         <out-version> - the format version to write as, 1 or 3 (2 doesn't
            exist)
         <border-out> - output - the output border file

         [-surface] - must be specified if the input is version 1
            <surface> - use this surface file for structure and number of
               vertices, ignore borders on other structures

      [-nifti-version-convert] - write a nifti file with a different version
         <input> - the input nifti file
         <version> - the nifti version to write as
         <output> - output - the output nifti file

      [-cifti-version-convert] - write a cifti file with a different version
         <cifti-in> - the input cifti file
         <version> - the cifti version to write as
         <cifti-out> - output - the output cifti file

      You may only specify one top-level option.


-file-information
LIST INFORMATION ABOUT A FILE'S CONTENT
   wb_command -file-information
      <data-file> - data file

      [-no-map-info] - do not show map information for files that support maps

      [-only-step-interval] - suppress normal output, print the interval
         between maps

      [-only-number-of-maps] - suppress normal output, print the number of maps

      [-only-map-names] - suppress normal output, print the names of all maps

      [-only-metadata] - suppress normal output, print file metadata

         [-key] - only print the metadata for one key, with no formatting
            <key> - the metadata key

      [-only-cifti-xml] - suppress normal output, print the cifti xml if the
         file type has it

      List information about the content of a data file.  Only one -only option
      may be specified.  The information listed when no -only option is present
      is dependent upon the type of data file.


-foci-get-projection-vertex
GET PROJECTION VERTEX FOR FOCI
   wb_command -foci-get-projection-vertex
      <foci> - the foci file
      <surface> - the surface related to the foci file
      <metric-out> - output - the output metric file

      [-name] - select a focus by name
         <name> - the name of the focus

      For each focus, a column is created in <metric-out>, and the vertex with
      the most influence on its projection is assigned a value of 1 in that
      column, with all other vertices 0.  If -name is used, only one focus will
      be used.


-foci-list-coords
OUTPUT FOCI COORDINATES IN A TEXT FILE
   wb_command -foci-list-coords
      <foci-file> - input foci file
      <coord-file-out> - output - the output coordinate text file

      [-names-out] - output the foci names
         <names-file-out> - output - text file to put foci names in

      Output the coordinates for every focus in the foci file, and optionally
      the focus names in a second text file.


-foci-resample
PROJECT FOCI TO A DIFFERENT SURFACE
   wb_command -foci-resample
      <foci-in> - the input foci file
      <foci-out> - output - the output foci file

      [-left-surfaces] - the left surfaces for resampling
         <current-surf> - the surface the foci are currently projected on
         <new-surf> - the surface to project the foci onto

      [-right-surfaces] - the right surfaces for resampling
         <current-surf> - the surface the foci are currently projected on
         <new-surf> - the surface to project the foci onto

      [-cerebellum-surfaces] - the cerebellum surfaces for resampling
         <current-surf> - the surface the foci are currently projected on
         <new-surf> - the surface to project the foci onto

      [-discard-distance-from-surface] - ignore the distance the foci are above
         or below the current surface

      [-restore-xyz] - put the original xyz coordinates into the foci, rather
         than the coordinates obtained from unprojection

      Unprojects foci from the <current-surf> for the structure, then projects
      them to <new-surf>.  If the foci have meaningful distances above or below
      the surface, use anatomical surfaces.  If the foci should be on the
      surface, use registered spheres and the options
      -discard-distance-from-surface and -restore-xyz.


-gifti-all-labels-to-rois
MAKE ROIS FROM ALL LABELS IN A GIFTI COLUMN
   wb_command -gifti-all-labels-to-rois
      <label-in> - the input gifti label file
      <map> - the number or name of the label map to use
      <metric-out> - output - the output metric file

      The output metric file has a column for each label in the specified input
      map, other than the ??? label, each of which contains an ROI of all
      vertices that are set to the corresponding label.


-gifti-convert
CONVERT A GIFTI FILE TO A DIFFERENT ENCODING
   wb_command -gifti-convert
      <gifti-encoding> - what the output encoding should be
      <input-gifti-file> - the input gifti file
      <output-gifti-file> - output - the output gifti file

      The value of <gifti-encoding> must be one of the following:

      ASCII
      BASE64_BINARY
      GZIP_BASE64_BINARY
      EXTERNAL_FILE_BINARY


-gifti-label-add-prefix
ADD PREFIX TO ALL LABEL NAMES IN A GIFTI LABEL FILE
   wb_command -gifti-label-add-prefix
      <label-in> - the input label file
      <prefix> - the prefix string to add
      <label-out> - output - the output label file

      For each label other than '???', prepend <prefix> to the label name.


-gifti-label-to-roi
MAKE A GIFTI LABEL INTO AN ROI METRIC
   wb_command -gifti-label-to-roi
      <label-in> - the input gifti label file
      <metric-out> - output - the output metric file

      [-name] - select label by name
         <label-name> - the label name that you want an roi of

      [-key] - select label by key
         <label-key> - the label key that you want an roi of

      [-map] - select a single label map to use
         <map> - the map number or name

      For each map in <label-in>, a map is created in <metric-out> where all
      locations labeled with <label-name> or with a key of <label-key> are
      given a value of 1, and all other locations are given 0.  Exactly one of
      -name and -key must be specified.  Specify -map to use only one map from
      <label-in>.


-label-dilate
DILATE A LABEL FILE
   wb_command -label-dilate
      <label> - the input label
      <surface> - the surface to dilate on
      <dilate-dist> - distance in mm to dilate the labels
      <label-out> - output - the output label file

      [-bad-vertex-roi] - specify an roi of vertices to overwrite, rather than
         vertices with the unlabeled key
         <roi-metric> - metric file, positive values denote vertices to have
            their values replaced

      [-column] - select a single column to dilate
         <column> - the column number or name

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Fills in label information for all vertices designated as bad, up to the
      specified distance away from other labels.  If -bad-vertex-roi is
      specified, all vertices, including those with the unlabeled key, are
      good, except for vertices with a positive value in the ROI.  If it is not
      specified, only vertices with the unlabeled key are bad.


-label-erode
ERODE A LABEL FILE
   wb_command -label-erode
      <label> - the input label
      <surface> - the surface to erode on
      <erode-dist> - distance in mm to erode the labels
      <label-out> - output - the output label file

      [-roi] - assume values outside this roi are labeled
         <roi-metric> - metric file, positive values denote vertices that have
            data

      [-column] - select a single column to erode
         <column> - the column number or name

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Around each vertex that is unlabeled, set surrounding vertices to
      unlabeled.  The surrounding vertices are all immediate neighbors and all
      vertices within the specified distance.

      Note that the -corrected-areas option uses an approximate correction for
      distance along the surface.


-label-export-table
EXPORT LABEL TABLE FROM GIFTI AS TEXT
   wb_command -label-export-table
      <label-in> - the input label file
      <table-out> - output - the output text file

      Takes the label table from the gifti label file, and writes it to a text
      format matching what is expected by -metric-label-import.


-label-mask
MASK A LABEL FILE
   wb_command -label-mask
      <label> - the label file to mask
      <mask> - the mask metric
      <label-out> - output - the output label file

      [-column] - select a single column
         <column> - the column number or name

      By default, the output label is a copy of the input label, but with the
      'unused' label wherever the mask metric is zero or negative.  if -column
      is specified, the output contains only one column, the masked version of
      the specified input column.


-label-merge
MERGE LABEL FILES INTO A NEW FILE
   wb_command -label-merge
      <label-out> - output - the output label

      [-label] - repeatable - specify an input label
         <label-in> - a label file to use columns from

         [-column] - repeatable - select a single column to use
            <column> - the column number or name

            [-up-to] - use an inclusive range of columns
               <last-column> - the number or name of the last column to include

               [-reverse] - use the range in reverse order

      Takes one or more label files and constructs a new label file by
      concatenating columns from them.  The input files must have the same
      number of vertices and the same structure.

      Example: wb_command -label-merge out.label.gii -label first.label.gii
      -column 1 -label second.label.gii

      This example would take the first column from first.label.gii and all
      subvolumes from second.label.gii, and write these to out.label.gii.


-label-modify-keys
CHANGE KEY VALUES IN A LABEL FILE
   wb_command -label-modify-keys
      <label-in> - the input label file
      <remap-file> - text file with old and new key values
      <label-out> - output - output label file

      [-column] - select a single column to use
         <column> - the column number or name

      <remap-file> should have lines of the form 'oldkey newkey', like so:

      3 5
      5 8
      8 2

      This would change the current label with key '3' to use the key '5'
      instead, 5 would use 8, and 8 would use 2.  Any collision in key values
      results in the label that was not specified in the remap file getting
      remapped to an otherwise unused key.  Remapping more than one key to the
      same new key, or the same key to more than one new key, results in an
      error.  This will not change the appearance of the file when displayed,
      it will change the keys in the data at the same time.


-label-probability
FIND FREQUENCY OF SURFACE LABELS
   wb_command -label-probability
      <label-maps> - label file containing individual label maps from many
         subjects
      <probability-metric-out> - output - the relative frequencies of each
         label at each vertex

      [-exclude-unlabeled] - don't make a probability map of the unlabeled key

      This command outputs a set of soft ROIs, one for each label in the input,
      where the value is how many of the input maps had that label at that
      vertex, divided by the number of input maps.


-label-resample
RESAMPLE A LABEL FILE TO A DIFFERENT MESH
   wb_command -label-resample
      <label-in> - the label file to resample
      <current-sphere> - a sphere surface with the mesh that the label file is
         currently on
      <new-sphere> - a sphere surface that is in register with <current-sphere>
         and has the desired output mesh
      <method> - the method name
      <label-out> - output - the output label file

      [-area-surfs] - specify surfaces to do vertex area correction based on
         <current-area> - a relevant anatomical surface with <current-sphere>
            mesh
         <new-area> - a relevant anatomical surface with <new-sphere> mesh

      [-area-metrics] - specify vertex area metrics to do area correction based
         on
         <current-area> - a metric file with vertex areas for <current-sphere>
            mesh
         <new-area> - a metric file with vertex areas for <new-sphere> mesh

      [-current-roi] - use an input roi on the current mesh to exclude non-data
         vertices
         <roi-metric> - the roi, as a metric file

      [-valid-roi-out] - output the ROI of vertices that got data from valid
         source vertices
         <roi-out> - output - the output roi as a metric

      [-largest] - use only the label of the vertex with the largest weight

      Resamples a label file, given two spherical surfaces that are in
      register.  If ADAP_BARY_AREA is used, exactly one of -area-surfs or
      -area-metrics must be specified.

      The ADAP_BARY_AREA method is recommended for label data, because it
      should be better at resolving vertices that are near multiple labels, or
      in case of downsampling.  Midthickness surfaces are recommended for the
      vertex areas for most data.

      The -largest option results in nearest vertex behavior when used with
      BARYCENTRIC, as it uses the value of the source vertex that has the
      largest weight.

      When -largest is not specified, the vertex weights are summed according
      to which label they correspond to, and the label with the largest sum is
      used.

      The <method> argument must be one of the following:

      ADAP_BARY_AREA
      BARYCENTRIC


-label-to-border
DRAW BORDERS AROUND LABELS
   wb_command -label-to-border
      <surface> - the surface to use for neighbor information
      <label-in> - the input label file
      <border-out> - output - the output border file

      [-placement] - set how far along the edge border points are drawn
         <fraction> - fraction along edge from inside vertex (default 0.33)

      [-column] - select a single column
         <column> - the column number or name

      For each label, finds all edges on the mesh that cross the boundary of
      the label, and draws borders through them.  By default, this is done on
      all columns in the input file, using the map name as the class name for
      the border.


-label-to-volume-mapping
MAP LABEL FILE TO VOLUME
   wb_command -label-to-volume-mapping
      <label> - the input label file
      <surface> - the surface to use coordinates from
      <volume-space> - a volume file in the desired output volume space
      <volume-out> - output - the output volume file

      [-nearest-vertex] - use the label from the vertex closest to the voxel
         center
         <distance> - how far from the surface to map labels to voxels, in mm

      [-ribbon-constrained] - use ribbon constrained mapping algorithm
         <inner-surf> - the inner surface of the ribbon
         <outer-surf> - the outer surface of the ribbon

         [-voxel-subdiv] - voxel divisions while estimating voxel weights
            <subdiv-num> - number of subdivisions, default 3

         [-greedy] - also put labels in voxels with less than 50% partial
            volume (legacy behavior)

         [-thick-columns] - use overlapping columns (legacy method)

      Maps labels from a gifti label file into a volume file.  You must specify
      exactly one mapping method option.  The -nearest-vertex method uses the
      label from the vertex closest to the voxel center.  The
      -ribbon-constrained method uses the same method as in
      -volume-to-surface-mapping, then uses the weights in reverse, with
      popularity logic to decide on a label to use.


-metadata-remove-provenance
REMOVE PROVENANCE INFORMATION FROM FILE METADATA
   wb_command -metadata-remove-provenance
      <input-file> - the file to remove provenance information from
      <output-file> - output - the name to save the modified file as

      Removes the provenance metadata fields added by workbench during
      processing.


-metadata-string-replace
REPLACE A STRING IN ALL METADATA OF A FILE
   wb_command -metadata-string-replace
      <input-file> - the file to replace metadata in
      <find-string> - the string to find
      <replace-string> - the string to replace <find-string> with
      <output-file> - output - the name to save the modified file as

      [-case-insensitive] - match with case variation also

      Replaces all occurrences of <find-string> in the metadata and map names
      of <input-file> with <replace-string>.


-metric-convert
CONVERT METRIC FILE TO FAKE NIFTI
   wb_command -metric-convert

      [-to-nifti] - convert metric to nifti
         <metric-in> - the metric to convert
         <nifti-out> - output - the output nifti file

      [-from-nifti] - convert nifti to metric
         <nifti-in> - the nifti file to convert
         <surface-in> - surface file to use number of vertices and structure
            from
         <metric-out> - output - the output metric file

      The purpose of this command is to convert between metric files and nifti1
      so that gifti-unaware programs can operate on the data.  You must specify
      exactly one of the options.


-metric-dilate
DILATE A METRIC FILE
   wb_command -metric-dilate
      <metric> - the metric to dilate
      <surface> - the surface to compute on
      <distance> - distance in mm to dilate
      <metric-out> - output - the output metric

      [-bad-vertex-roi] - specify an roi of vertices to overwrite, rather than
         vertices with value zero
         <roi-metric> - metric file, positive values denote vertices to have
            their values replaced

      [-data-roi] - specify an roi of where there is data
         <roi-metric> - metric file, positive values denote vertices that have
            data

      [-column] - select a single column to dilate
         <column> - the column number or name

      [-nearest] - use the nearest good value instead of a weighted average

      [-linear] - fill in values with linear interpolation along strongest
         gradient

      [-exponent] - use a different exponent in the weighting function
         <exponent> - exponent 'n' to use in (area / (distance ^ n)) as the
            weighting function (default 2)

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      For all metric vertices that are designated as bad, if they neighbor a
      non-bad vertex with data or are within the specified distance of such a
      vertex, replace the value with a distance weighted average of nearby
      non-bad vertices that have data, otherwise set the value to zero.  No
      matter how small <distance> is, dilation will always use at least the
      immediate neighbor vertices.  If -nearest is specified, it will use the
      value from the closest non-bad vertex with data within range instead of a
      weighted average.

      If -bad-vertex-roi is specified, only vertices with a positive value in
      the ROI are bad.  If it is not specified, only vertices that have data,
      with a value of zero, are bad.  If -data-roi is not specified, all
      vertices are assumed to have data.

      Note that the -corrected-areas option uses an approximate correction for
      the change in distances along a group average surface.


-metric-erode
ERODE A METRIC FILE
   wb_command -metric-erode
      <metric> - the metric file to erode
      <surface> - the surface to compute on
      <distance> - distance in mm to erode
      <metric-out> - output - the output metric

      [-roi] - assume values outside this roi are nonzero
         <roi-metric> - metric file, positive values denote vertices that have
            data

      [-column] - select a single column to erode
         <column> - the column number or name

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Around each vertex with a value of zero, set surrounding vertices to
      zero.  The surrounding vertices are all immediate neighbors and all
      vertices within the specified distance.

      Note that the -corrected-areas option uses an approximate correction for
      distance along the surface.


-metric-estimate-fwhm
ESTIMATE FWHM SMOOTHNESS OF A METRIC FILE
   wb_command -metric-estimate-fwhm
      <surface> - the surface to use for distance and neighbor information
      <metric-in> - the input metric

      [-roi] - use only data within an ROI
         <roi-metric> - the metric file to use as an ROI

      [-column] - select a single column to estimate smoothness of
         <column> - the column number or name

      [-whole-file] - estimate for the whole file at once, not each column
         separately

         [-demean] - subtract the mean image before estimating smoothness

      Estimates the smoothness of the metric columns, printing the estimates to
      standard output.  These estimates ignore variation in vertex spacing.


-metric-extrema
FIND EXTREMA IN A METRIC FILE
   wb_command -metric-extrema
      <surface> - the surface to use for distance information
      <metric-in> - the metric to find the extrema of
      <distance> - the minimum distance between identified extrema of the same
         type
      <metric-out> - output - the output extrema metric

      [-presmooth] - smooth the metric before finding extrema
         <kernel> - the sigma for the gaussian smoothing kernel, in mm

      [-roi] - ignore values outside the selected area
         <roi-metric> - the area to find extrema in, as a metric

      [-threshold] - ignore small extrema
         <low> - the largest value to consider for being a minimum
         <high> - the smallest value to consider for being a maximum

      [-sum-columns] - output the sum of the extrema columns instead of each
         column separately

      [-consolidate-mode] - use consolidation of local minima instead of a
         large neighborhood

      [-only-maxima] - only find the maxima

      [-only-minima] - only find the minima

      [-column] - select a single column to find extrema in
         <column> - the column number or name

      Finds extrema in a metric file, such that no two extrema of the same type
      are within <distance> of each other.  The extrema are labeled as -1 for
      minima, 1 for maxima, 0 otherwise.  If -only-maxima or -only-minima is
      specified, then it will ignore extrema not of the specified type.  These
      options are mutually exclusive.

      If -roi is specified, not only is data outside the roi not used, but any
      vertex on the edge of the ROI will never be counted as an extrema, in
      case the ROI cuts across a gradient, which would otherwise generate
      extrema where there should be none.

      If -sum-columns is specified, these extrema columns are summed, and the
      output has a single column with this result.

      By default, a datapoint is an extrema only if it is more extreme than
      every other datapoint that is within <distance> from it.  If
      -consolidate-mode is used, it instead starts by finding all datapoints
      that are more extreme than their immediate neighbors, then while there
      are any extrema within <distance> of each other, take the two extrema
      closest to each other and merge them into one by a weighted average based
      on how many original extrema have been merged into each.

      By default, all input columns are used with no smoothing, use -column to
      specify a single column to use, and -presmooth to smooth the input before
      finding the extrema.


-metric-false-correlation
COMPARE CORRELATION LOCALLY AND ACROSS/THROUGH SULCI/GYRI
   wb_command -metric-false-correlation
      <surface> - the surface to compute geodesic and 3D distance with
      <metric-in> - the metric to correlate
      <3D-dist> - maximum 3D distance to check around each vertex
      <geo-outer> - maximum geodesic distance to use for neighboring
         correlation
      <geo-inner> - minimum geodesic distance to use for neighboring
         correlation
      <metric-out> - output - the output metric

      [-roi] - select a region of interest that has data
         <roi-metric> - the region, as a metric file

      [-dump-text] - dump the raw measures used to a text file
         <text-out> - the output text file

      For each vertex, compute the average correlation within a range of
      geodesic distances that don't cross a sulcus/gyrus, and the correlation
      to the closest vertex crossing a sulcus/gyrus.  A vertex is considered to
      cross a sulcus/gyrus if the 3D distance is less than a third of the
      geodesic distance.  The output file contains the ratio between these
      correlations, and some additional maps to help explain the ratio.


-metric-fill-holes
FILL HOLES IN AN ROI METRIC
   wb_command -metric-fill-holes
      <surface> - the surface to use for neighbor information
      <metric-in> - the input ROI metric
      <metric-out> - output - the output ROI metric

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Finds all connected areas that are not included in the ROI, and writes
      ones into all but the largest one, in terms of surface area.


-metric-find-clusters
FILTER CLUSTERS BY SURFACE AREA
   wb_command -metric-find-clusters
      <surface> - the surface to compute on
      <metric-in> - the input metric
      <value-threshold> - threshold for data values
      <minimum-area> - threshold for cluster area, in mm^2
      <metric-out> - output - the output metric

      [-less-than] - find values less than <value-threshold>, rather than
         greater

      [-roi] - select a region of interest
         <roi-metric> - the roi, as a metric

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      [-column] - select a single column
         <column> - the column number or name

      [-size-ratio] - ignore clusters smaller than a given fraction of the
         largest cluster in map
         <ratio> - fraction of the largest cluster's area

      [-distance] - ignore clusters further than a given distance from the
         largest cluster
         <distance> - how far from the largest cluster a cluster can be, edge
            to edge, in mm

      [-start] - start labeling clusters from a value other than 1
         <startval> - the value to give the first cluster found

      Outputs a metric with nonzero integers for all vertices within a large
      enough cluster, and zeros elsewhere.  The integers denote cluster
      membership (by default, first cluster found will use value 1, second
      cluster 2, etc).  By default, values greater than <value-threshold> are
      considered to be in a cluster, use -less-than to test for values less
      than the threshold.  To apply this as a mask to the data, or to do more
      complicated thresholding, see -metric-math.


-metric-gradient
SURFACE GRADIENT OF A METRIC FILE
   wb_command -metric-gradient
      <surface> - the surface to compute the gradient on
      <metric-in> - the metric to compute the gradient of
      <metric-out> - output - the magnitude of the gradient

      [-presmooth] - smooth the metric before computing the gradient
         <kernel> - the sigma for the gaussian smoothing kernel, in mm

      [-roi] - select a region of interest to take the gradient of
         <roi-metric> - the area to take the gradient within, as a metric

         [-match-columns] - for each input column, use the corresponding column
            from the roi

      [-vectors] - output gradient vectors
         <vector-metric-out> - output - the vectors as a metric file

      [-column] - select a single column to compute the gradient of
         <column> - the column number or name

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      [-average-normals] - average the normals of each vertex with its
         neighbors before using them to compute the gradient

      At each vertex, the immediate neighbors are unfolded onto a plane tangent
      to the surface at the vertex (specifically, perpendicular to the normal).
      The gradient is computed using a regression between the unfolded
      positions of the vertices and their values.  The gradient is then given
      by the slopes of the regression, and reconstructed as a 3D gradient
      vector.  By default, takes the gradient of all columns, with no
      presmoothing, across the whole surface, without averaging the normals of
      the surface among neighbors.

      When using -corrected-areas, note that it is an approximate correction.
      Doing smoothing on individual surfaces before averaging/gradient is
      preferred, when possible, in order to make use of the original surface
      structure.

      Specifying an ROI will restrict the gradient to only use data from where
      the ROI metric is positive, and output zeros anywhere the ROI metric is
      not positive.

      By default, the first column of the roi metric is used for all input
      columns.  When -match-columns is specified to the -roi option, the input
      and roi metrics must have the same number of columns, and for each input
      column's index, the same column index is used in the roi metric.  If the
      -match-columns option to -roi is used while the -column option is also
      used, the number of columns of the roi metric must match the input
      metric, and it will use the roi column with the index of the selected
      input column.

      The vector output metric is organized such that the X, Y, and Z
      components from a single input column are consecutive columns.


-metric-label-import
IMPORT A GIFTI LABEL FILE FROM A METRIC FILE
   wb_command -metric-label-import
      <input> - the input metric file
      <label-list-file> - text file containing the values and names for labels
      <output> - output - the output gifti label file

      [-discard-others] - set any values not mentioned in the label list to the
         ??? label

      [-unlabeled-value] - set the value that will be interpreted as unlabeled
         <value> - the numeric value for unlabeled (default 0)

      [-column] - select a single column to import
         <column> - the column number or name

      [-drop-unused-labels] - remove any unused label values from the label
         table

      Creates a new gifti label file from a metric file with label-like values.
      You may specify the empty string ('' will work on linux/mac) for
      <label-list-file>, which will be treated as if it is an empty file.  The
      label list file must have lines of the following format:

      <labelname>
      <value> <red> <green> <blue> <alpha>

      Do not specify the "unlabeled" key in the file, it is assumed that 0
      means not labeled unless -unlabeled-value is specified.  Label names must
      be on a separate line, but may contain spaces or other unusual characters
      (but not newline).  Whitespace is trimmed from both ends of the label
      name, but is kept if it is in the middle of a label.  The values of red,
      green, blue and alpha must be integers from 0 to 255, and will specify
      the color the label is drawn as (alpha of 255 means opaque, which is
      probably what you want).  By default, it will set new label names with
      names of LABEL_# for any values encountered that are not mentioned in the
      list file, specify -discard-others to instead set these voxels to the
      "unlabeled" key.


-metric-mask
MASK A METRIC FILE
   wb_command -metric-mask
      <metric> - the input metric
      <mask> - the mask metric
      <metric-out> - output - the output metric

      [-column] - select a single column
         <column> - the column number or name

      By default, the output metric is a copy of the input metric, but with
      zeros wherever the mask metric is zero or negative.  if -column is
      specified, the output contains only one column, the masked version of the
      specified input column.


-metric-math
EVALUATE EXPRESSION ON METRIC FILES
   wb_command -metric-math
      <expression> - the expression to evaluate, in quotes
      <metric-out> - output - the output metric

      [-fixnan] - replace NaN results with a value
         <replace> - value to replace NaN with

      [-var] - repeatable - a metric to use as a variable
         <name> - the name of the variable, as used in the expression
         <metric> - the metric file to use as this variable

         [-column] - select a single column
            <column> - the column number or name

         [-repeat] - reuse a single column for each column of calculation

      This command evaluates <expression> at each surface vertex independently.
      There must be at least one -var option (to get the structure, number of
      vertices, and number of columns from), even if the <name> specified in it
      isn't used in <expression>.  All metrics must have the same number of
      vertices.  Filenames are not valid in <expression>, use a variable name
      and a -var option with matching <name> to specify an input file.  If the
      -column option is given to any -var option, only one column is used from
      that file.  If -repeat is specified, the file must either have only one
      column, or have the -column option specified.  All files that don't use
      -repeat must have the same number of columns requested to be used.  The
      format of <expression> is as follows:

      Expressions consist of constants, variables, operators, parentheses, and
      functions, in infix notation, such as 'exp(-x + 3) * scale'.  Variables
      are strings of any length, using the characters a-z, A-Z, 0-9, and _, but
      may not take the name of a named constant.  Currently, there is only one
      named constant, PI.  The operators are +, -, *, /, ^, >, <, >=, <=, ==,
      !=, !, &&, ||.  These behave as in C, except that ^ is exponentiation,
      i.e. pow(x, y), and takes higher precedence than other binary operators
      (also, '-3^-4^-5' means '-(3^(-(4^-5)))').  The <=, >=, ==, and !=
      operators are given a small amount of wiggle room, equal to one millionth
      of the smaller of the absolute values of the values being compared.

      Comparison and logical operators return 0 or 1, you can do masking with
      expressions like 'x * (mask > 0)'.  For all logical operators, an input
      is considered true iff it is greater than 0.  The expression '0 < x < 5'
      is not syntactically wrong, but it will NOT do what is desired, because
      it is evaluated left to right, i.e. '((0 < x) < 5)', which will always
      return 1, as both possible results of a comparison are less than 5.  A
      warning is generated if an expression of this type is detected.  Use
      something like 'x > 0 && x < 5' to get the desired behavior.

      Whitespace between elements is ignored, ' sin ( 2 * x ) ' is equivalent
      to 'sin(2*x)', but 's in(2*x)' is an error.  Implied multiplication is
      not allowed, the expression '2x' will be parsed as a variable.
      Parentheses are (), do not use [] or {}.  Functions require parentheses,
      the expression 'sin x' is an error.

      The following functions are supported:

         sin: 1 argument, the sine of the argument (units are radians)
         cos: 1 argument, the cosine of the argument (units are radians)
         tan: 1 argument, the tangent of the argument (units are radians)
         asin: 1 argument, the inverse of sine of the argument, in radians
         acos: 1 argument, the inverse of cosine of the argument, in radians
         atan: 1 argument, the inverse of tangent of the argument, in radians
         atan2: 2 arguments, atan2(y, x) returns the inverse of tangent of
      (y/x), in radians, determining quadrant by the sign of both arguments
         sinh: 1 argument, the hyperbolic sine of the argument
         cosh: 1 argument, the hyperbolic cosine of the argument
         tanh: 1 argument, the hyperboloc tangent of the argument
         asinh: 1 argument, the inverse hyperbolic sine of the argument
         acosh: 1 argument, the inverse hyperbolic cosine of the argument
         atanh: 1 argument, the inverse hyperboloc tangent of the argument
         ln: 1 argument, the natural logarithm of the argument
         exp: 1 argument, the constant e raised to the power of the argument
         log: 1 argument, the base 10 logarithm of the argument
         sqrt: 1 argument, the square root of the argument
         abs: 1 argument, the absolute value of the argument
         floor: 1 argument, the largest integer not greater than the argument
         round: 1 argument, the nearest integer, with ties rounded away from
      zero
         ceil: 1 argument, the smallest integer not less than the argument
         min: 2 arguments, min(x, y) returns y if (x > y), x otherwise
         max: 2 arguments, max(x, y) returns y if (x < y), x otherwise
         mod: 2 arguments, mod(x, y) = x - y * floor(x / y), or 0 if y == 0
         clamp: 3 arguments, clamp(x, low, high) = min(max(x, low), high)


-metric-merge
MERGE METRIC FILES INTO A NEW FILE
   wb_command -metric-merge
      <metric-out> - output - the output metric

      [-metric] - repeatable - specify an input metric
         <metric-in> - a metric file to use columns from

         [-column] - repeatable - select a single column to use
            <column> - the column number or name

            [-up-to] - use an inclusive range of columns
               <last-column> - the number or name of the last column to include

               [-reverse] - use the range in reverse order

      Takes one or more metric files and constructs a new metric file by
      concatenating columns from them.  The input metric files must have the
      same number of vertices and same structure.

      Example: wb_command -metric-merge out.func.gii -metric first.func.gii
      -column 1 -metric second.func.gii

      This example would take the first column from first.func.gii, followed by
      all columns from second.func.gii, and write these columns to
      out.func.gii.


-metric-palette
SET THE PALETTE OF A METRIC FILE
   wb_command -metric-palette
      <metric> - the metric to modify
      <mode> - the mapping mode

      [-column] - select a single column
         <column> - the column number or name

      [-pos-percent] - percentage min/max for positive data coloring
         <pos-min-%> - the percentile for the least positive data
         <pos-max-%> - the percentile for the most positive data

      [-neg-percent] - percentage min/max for negative data coloring
         <neg-min-%> - the percentile for the least negative data
         <neg-max-%> - the percentile for the most negative data

      [-pos-user] - user min/max values for positive data coloring
         <pos-min-user> - the value for the least positive data
         <pos-max-user> - the value for the most positive data

      [-neg-user] - user min/max values for negative data coloring
         <neg-min-user> - the value for the least negative data
         <neg-max-user> - the value for the most negative data

      [-interpolate] - interpolate colors
         <interpolate> - boolean, whether to interpolate

      [-disp-pos] - display positive data
         <display> - boolean, whether to display

      [-disp-neg] - display positive data
         <display> - boolean, whether to display

      [-disp-zero] - display data closer to zero than the min cutoff
         <display> - boolean, whether to display

      [-palette-name] - set the palette used
         <name> - the name of the palette

      [-thresholding] - set the thresholding
         <type> - thresholding setting
         <test> - show values inside or outside thresholds
         <min> - lower threshold
         <max> - upper threshold

      [-inversion] - specify palette inversion
         <type> - the type of inversion

      The original metric file is overwritten with the modified version.  By
      default, all columns of the metric file are adjusted to the new settings,
      use the -column option to change only one column.  Mapping settings not
      specified in options will be taken from the first column.  The <mode>
      argument must be one of the following:

      MODE_AUTO_SCALE
      MODE_AUTO_SCALE_ABSOLUTE_PERCENTAGE
      MODE_AUTO_SCALE_PERCENTAGE
      MODE_USER_SCALE

      The <name> argument to -palette-name must be one of the following:

      ROY-BIG-BL
      videen_style
      Gray_Interp_Positive
      Gray_Interp
      PSYCH-FIXED
      RBGYR20
      RBGYR20P
      RYGBR4_positive
      RGRBR_mirror90_pos
      Orange-Yellow
      POS_NEG_ZERO
      red-yellow
      blue-lightblue
      FSL
      power_surf
      fsl_red
      fsl_green
      fsl_blue
      fsl_yellow
      RedWhiteBlue
      cool-warm
      spectral
      RY-BC-BL
      magma
      JET256
      PSYCH
      PSYCH-NO-NONE
      ROY-BIG
      clear_brain
      fidl
      raich4_clrmid
      raich6_clrmid
      HSB8_clrmid
      POS_NEG

      The <type> argument to -thresholding must be one of the following:

      THRESHOLD_TYPE_OFF
      THRESHOLD_TYPE_NORMAL
      THRESHOLD_TYPE_FILE

      The <test> argument to -thresholding must be one of the following:

      THRESHOLD_TEST_SHOW_OUTSIDE
      THRESHOLD_TEST_SHOW_INSIDE

      The <type> argument to -inversion must be one of the following:

      OFF
      POSITIVE_WITH_NEGATIVE
      POSITIVE_NEGATIVE_SEPARATE


-metric-reduce
PERFORM REDUCTION OPERATION ACROSS METRIC COLUMNS
   wb_command -metric-reduce
      <metric-in> - the metric to reduce
      <operation> - the reduction operator to use
      <metric-out> - output - the output metric

      [-exclude-outliers] - exclude non-numeric values and outliers by standard
         deviation
         <sigma-below> - number of standard deviations below the mean to
            include
         <sigma-above> - number of standard deviations above the mean to
            include

      [-only-numeric] - exclude non-numeric values

      For each surface vertex, takes the data across columns as a vector, and
      performs the specified reduction on it, putting the result into the
      single output column at that vertex.  The reduction operators are as
      follows:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data


-metric-regression
REGRESS METRICS OUT OF A METRIC FILE
   wb_command -metric-regression
      <metric-in> - the metric to regress from
      <metric-out> - output - the output metric

      [-roi] - only regress inside an roi
         <roi-metric> - the area to use for regression, as a metric

      [-column] - select a single column to regress from
         <column> - the column number or name

      [-remove] - repeatable - specify a metric to regress out
         <metric> - the metric file to use

         [-remove-column] - select a column to use, rather than all
            <column> - the column number or name

      [-keep] - repeatable - specify a metric to include in regression, but not
         remove
         <metric> - the metric file to use

         [-keep-column] - select a column to use, rather than all
            <column> - the column number or name

      For each regressor, its mean across the surface is subtracted from its
      data.  Each input map is then regressed against these, and a constant
      term.  The resulting regressed slopes of all regressors specified with
      -remove are multiplied with their respective regressor maps, and these
      are subtracted from the input map.


-metric-remove-islands
REMOVE ISLANDS FROM AN ROI METRIC
   wb_command -metric-remove-islands
      <surface> - the surface to use for neighbor information
      <metric-in> - the input ROI metric
      <metric-out> - output - the output ROI metric

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Finds all connected areas in the ROI, and zeros out all but the largest
      one, in terms of surface area.


-metric-resample
RESAMPLE A METRIC FILE TO A DIFFERENT MESH
   wb_command -metric-resample
      <metric-in> - the metric file to resample
      <current-sphere> - a sphere surface with the mesh that the metric is
         currently on
      <new-sphere> - a sphere surface that is in register with <current-sphere>
         and has the desired output mesh
      <method> - the method name
      <metric-out> - output - the output metric

      [-area-surfs] - specify surfaces to do vertex area correction based on
         <current-area> - a relevant anatomical surface with <current-sphere>
            mesh
         <new-area> - a relevant anatomical surface with <new-sphere> mesh

      [-area-metrics] - specify vertex area metrics to do area correction based
         on
         <current-area> - a metric file with vertex areas for <current-sphere>
            mesh
         <new-area> - a metric file with vertex areas for <new-sphere> mesh

      [-current-roi] - use an input roi on the current mesh to exclude non-data
         vertices
         <roi-metric> - the roi, as a metric file

      [-valid-roi-out] - output the ROI of vertices that got data from valid
         source vertices
         <roi-out> - output - the output roi as a metric

      [-largest] - use only the value of the vertex with the largest weight

      Resamples a metric file, given two spherical surfaces that are in
      register.  If ADAP_BARY_AREA is used, exactly one of -area-surfs or
      -area-metrics must be specified.

      The ADAP_BARY_AREA method is recommended for ordinary metric data,
      because it should use all data while downsampling, unlike BARYCENTRIC.
      The recommended areas option for most data is individual midthicknesses
      for individual data, and averaged vertex area metrics from individual
      midthicknesses for group average data.

      The -current-roi option only masks the input, the output may be slightly
      dilated in comparison, consider using -metric-mask on the output when
      using -current-roi.

      The -largest option results in nearest vertex behavior when used with
      BARYCENTRIC.  When resampling a binary metric, consider thresholding at
      0.5 after resampling rather than using -largest.

      The <method> argument must be one of the following:

      ADAP_BARY_AREA
      BARYCENTRIC


-metric-rois-from-extrema
CREATE METRIC ROI MAPS FROM EXTREMA MAPS
   wb_command -metric-rois-from-extrema
      <surface> - the surface to use for geodesic distance
      <metric> - the input metric file
      <limit> - geodesic distance limit from vertex, in mm
      <metric-out> - output - the output metric file

      [-gaussian] - generate a gaussian kernel instead of a flat ROI
         <sigma> - the sigma for the gaussian kernel, in mm

      [-roi] - select a region of interest to use
         <roi-metric> - the area to use, as a metric

      [-overlap-logic] - how to handle overlapping ROIs, default ALLOW
         <method> - the method of resolving overlaps

      [-column] - select a single input column to use
         <column> - the column number or name

      For each nonzero value in each map, make a map with an ROI around that
      location.  If the -gaussian option is specified, then normalized gaussian
      kernels are output instead of ROIs.  The <method> argument to
      -overlap-logic must be one of ALLOW, CLOSEST, or EXCLUDE.  ALLOW is the
      default, and means that ROIs are treated independently and may overlap.
      CLOSEST means that ROIs may not overlap, and that no ROI contains
      vertices that are closer to a different seed vertex.  EXCLUDE means that
      ROIs may not overlap, and that any vertex within range of more than one
      ROI does not belong to any ROI.


-metric-rois-to-border
DRAW BORDERS AROUND METRIC ROIS
   wb_command -metric-rois-to-border
      <surface> - the surface to use for neighbor information
      <metric> - the input metric containing ROIs
      <class-name> - the name to use for the class of the output borders
      <border-out> - output - the output border file

      [-placement] - set how far along the edge border points are drawn
         <fraction> - fraction along edge from inside vertex (default 0.33)

      [-column] - select a single column
         <column> - the column number or name

      For each ROI column, finds all edges on the mesh that cross the boundary
      of the ROI, and draws borders through them.  By default, this is done on
      all columns in the input file, using the map name as the name for the
      border.


-metric-smoothing
SMOOTH A METRIC FILE
   wb_command -metric-smoothing
      <surface> - the surface to smooth on
      <metric-in> - the metric to smooth
      <smoothing-kernel> - the sigma for the gaussian kernel function, in mm
      <metric-out> - output - the output metric

      [-roi] - select a region of interest to smooth
         <roi-metric> - the roi to smooth within, as a metric

         [-match-columns] - for each input column, use the corresponding column
            from the roi

      [-fix-zeros] - treat zero values as not being data

      [-column] - select a single column to smooth
         <column> - the column number or name

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      [-method] - select smoothing method, default GEO_GAUSS_AREA
         <method> - the name of the smoothing method

      Smooth a metric file on a surface.  By default, smooths all input columns
      on the entire surface, specify -column to use only one input column, and
      -roi to smooth only where the roi metric is greater than 0, outputting
      zeros elsewhere.

      When using -roi, input data outside the ROI is not used to compute the
      smoothed values.  By default, the first column of the roi metric is used
      for all input columns.  When -match-columns is specified to the -roi
      option, the input and roi metrics must have the same number of columns,
      and for each input column's index, the same column index is used in the
      roi metric.  If the -match-columns option to -roi is used while the
      -column option is also used, the number of columns must match between the
      roi and input metric, and it will use the roi column with the index of
      the selected input column.

      The -fix-zeros option causes the smoothing to not use an input value if
      it is zero, but still write a smoothed value to the vertex.  This is
      useful for zeros that indicate lack of information, preventing them from
      pulling down the intensity of nearby vertices, while giving the zero an
      extrapolated value.

      The -corrected-areas option is intended for when it is unavoidable to
      smooth on a group average surface, it is only an approximate correction
      for the reduction of structure in a group average surface.  It is better
      to smooth the data on individuals before averaging, when feasible.

      Valid values for <method> are:

      GEO_GAUSS_AREA - uses a geodesic gaussian kernel, and normalizes based on
      vertex area in order to work more reliably on irregular surfaces

      GEO_GAUSS_EQUAL - uses a geodesic gaussian kernel, and normalizes
      assuming each vertex has equal importance

      GEO_GAUSS - matches geodesic gaussian smoothing from caret5, but does not
      check kernels for having unequal importance

      The GEO_GAUSS_AREA method is the default because it is usually the
      correct choice.  GEO_GAUSS_EQUAL may be the correct choice when the sum
      of vertex values is more meaningful then the surface integral (sum of
      values .* areas), for instance when smoothing vertex areas (the sum is
      the total surface area, while the surface integral is the sum of squares
      of the vertex areas).  The GEO_GAUSS method is not recommended, it exists
      mainly to replicate methods of studies done with caret5's geodesic
      smoothing.


-metric-stats
SPATIAL STATISTICS ON A METRIC FILE
   wb_command -metric-stats
      <metric-in> - the input metric

      [-reduce] - use a reduction operation
         <operation> - the reduction operation

      [-percentile] - give the value at a percentile
         <percent> - the percentile to find

      [-column] - only display output for one column
         <column> - the column number or name

      [-roi] - only consider data inside an roi
         <roi-metric> - the roi, as a metric file

         [-match-maps] - each column of input uses the corresponding column
            from the roi file

      [-show-map-name] - print map index and name before each output

      For each column of the input, a single number is printed, resulting from
      the specified reduction or percentile operation.  Use -column to only
      give output for a single column.  Use -roi to consider only the data
      within a region.  Exactly one of -reduce or -percentile must be
      specified.

      The argument to the -reduce option must be one of the following:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data


-metric-tfce
DO TFCE ON A METRIC FILE
   wb_command -metric-tfce
      <surface> - the surface to compute on
      <metric-in> - the metric to run TFCE on
      <metric-out> - output - the output metric

      [-presmooth] - smooth the metric before running TFCE
         <kernel> - the sigma for the gaussian smoothing kernel, in mm

      [-roi] - select a region of interest to run TFCE on
         <roi-metric> - the area to run TFCE on, as a metric

      [-parameters] - set parameters for TFCE integral
         <E> - exponent for cluster area (default 1.0)
         <H> - exponent for threshold value (default 2.0)

      [-column] - select a single column
         <column> - the column number or name

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Threshold-free cluster enhancement is a method to increase the relative
      value of regions that would form clusters in a standard thresholding
      test.  This is accomplished by evaluating the integral of:

      e(h, p)^E * h^H * dh

      at each vertex p, where h ranges from 0 to the maximum value in the data,
      and e(h, p) is the extent of the cluster containing vertex p at threshold
      h.  Negative values are similarly enhanced by negating the data, running
      the same process, and negating the result.

      When using -presmooth with -corrected-areas, note that it is an
      approximate correction within the smoothing algorithm (the TFCE
      correction is exact).  Doing smoothing on individual surfaces before
      averaging/TFCE is preferred, when possible, in order to better tie the
      smoothing kernel size to the original feature size.

      The TFCE method is explained in: Smith SM, Nichols TE., "Threshold-free
      cluster enhancement: addressing problems of smoothing, threshold
      dependence and localisation in cluster inference." Neuroimage. 2009 Jan
      1;44(1):83-98. PMID: 18501637


-metric-to-volume-mapping
MAP METRIC FILE TO VOLUME
   wb_command -metric-to-volume-mapping
      <metric> - the input metric file
      <surface> - the surface to use coordinates from
      <volume-space> - a volume file in the desired output volume space
      <volume-out> - output - the output volume file

      [-nearest-vertex] - use the value from the vertex closest to the voxel
         center
         <distance> - how far from the surface to map values to voxels, in mm

      [-ribbon-constrained] - use ribbon constrained mapping algorithm
         <inner-surf> - the inner surface of the ribbon
         <outer-surf> - the outer surface of the ribbon

         [-voxel-subdiv] - voxel divisions while estimating voxel weights
            <subdiv-num> - number of subdivisions, default 3

         [-greedy] - instead of antialiasing partial-volumed voxels, put full
            metric values (legacy behavior)

         [-thick-columns] - use overlapping columns (legacy method)

      Maps values from a metric file into a volume file.  You must specify
      exactly one mapping method option.  The -nearest-vertex method uses the
      value from the vertex closest to the voxel center (useful for integer
      values).  The -ribbon-constrained method uses the same method as in
      -volume-to-surface-mapping, then uses the weights in reverse.  Mapping to
      lower resolutions than the mesh may require a larger -voxel-subdiv value
      in order to have all of the surface data participate.


-metric-vector-operation
DO A VECTOR OPERATION ON METRIC FILES
   wb_command -metric-vector-operation
      <vectors-a> - first vector input file
      <vectors-b> - second vector input file
      <operation> - what vector operation to do
      <metric-out> - output - the output file

      [-normalize-a] - normalize vectors of first input

      [-normalize-b] - normalize vectors of second input

      [-normalize-output] - normalize output vectors (not valid for dot
         product)

      [-magnitude] - output the magnitude of the result (not valid for dot
         product)

      Does a vector operation on two metric files (that must have a multiple of
      3 columns).  Either of the inputs may have multiple vectors (more than 3
      columns), but not both (at least one must have exactly 3 columns).  The
      -magnitude and -normalize-output options may not be specified together,
      or with an operation that returns a scalar (dot product).  The
      <operation> parameter must be one of the following:

      DOT
      CROSS
      ADD
      SUBTRACT


-metric-vector-toward-roi
FIND IF VECTORS POINT TOWARD AN ROI
   wb_command -metric-vector-toward-roi
      <surface> - the surface to compute on
      <target-roi> - the roi to find the shortest path to
      <metric-out> - output - the output metric

      [-roi] - don't compute for vertices outside an roi
         <roi-metric> - the region to compute inside, as a metric

      At each vertex, compute the vector along the start of the shortest path
      to the ROI.


-metric-weighted-stats
WEIGHTED SPATIAL STATISTICS ON A METRIC FILE
   wb_command -metric-weighted-stats
      <metric-in> - the input metric

      [-area-surface] - use vertex areas as weights
         <area-surface> - the surface to use for vertex areas

      [-weight-metric] - use weights from a metric file
         <weight-metric> - metric file containing the weights

      [-column] - only display output for one column
         <column> - the column number or name

      [-roi] - only consider data inside an roi
         <roi-metric> - the roi, as a metric file

         [-match-maps] - each column of input uses the corresponding column
            from the roi file

      [-mean] - compute weighted mean

      [-stdev] - compute weighted standard deviation

         [-sample] - estimate population stdev from the sample

      [-percentile] - compute weighted percentile
         <percent> - the percentile to find

      [-sum] - compute weighted sum

      [-show-map-name] - print map index and name before each output

      For each column of the input, a single number is printed, resulting from
      the specified operation.  You must specify exactly one of -area-surface
      or -weight-metric.  Use -column to only give output for a single column.
      Use -roi to consider only the data within a region.  Exactly one of
      -mean, -stdev, -percentile or -sum must be specified.

      Using -sum with -area-surface (or -weight-metric with a metric containing
      similar data) is equivalent to integrating with respect to surface area.
      For example, if you want to find the surface area within an roi, do this:

      $ wb_command -metric-weighted-stats roi.func.gii -sum -area-surface
      midthickness.surf.gii


-nifti-information
DISPLAY INFORMATION ABOUT A NIFTI/CIFTI FILE
   wb_command -nifti-information
      <nifti-file> - the nifti/cifti file to examine

      [-print-header] - display the header contents

         [-allow-truncated] - print the header even if the data is truncated

      [-print-matrix] - output the values in the matrix (cifti only)

      [-print-xml] - print the cifti XML (cifti only)

         [-version] - convert the XML to a specific CIFTI version (default is
            the file's cifti version)
            <version> - the CIFTI version to use

      You must specify at least one -print-* option.


-probtrackx-dot-convert
CONVERT A .DOT FILE FROM PROBTRACKX TO CIFTI
   wb_command -probtrackx-dot-convert
      <dot-file> - input .dot file
      <cifti-out> - output - output cifti file

      [-row-voxels] - the output mapping along a row will be voxels
         <voxel-list-file> - a text file containing IJK indices for the voxels
            used
         <label-vol> - a label volume with the dimensions and sform used, with
            structure labels

      [-row-surface] - the output mapping along a row will be surface vertices
         <roi-metric> - a metric file with positive values on all vertices used

      [-row-cifti] - take the mapping along a row from a cifti file
         <cifti> - the cifti file to take the mapping from
         <direction> - which dimension to take the mapping along, ROW or COLUMN

      [-col-voxels] - the output mapping along a column will be voxels
         <voxel-list-file> - a text file containing IJK indices for the voxels
            used
         <label-vol> - a label volume with the dimensions and sform used, with
            structure labels

      [-col-surface] - the output mapping along a column will be surface
         vertices
         <roi-metric> - a metric file with positive values on all vertices used

      [-col-cifti] - take the mapping along a column from a cifti file
         <cifti> - the cifti file to take the mapping from
         <direction> - which dimension to take the mapping along, ROW or COLUMN

      [-transpose] - transpose the input matrix

      [-make-symmetric] - transform half-square input into full matrix output

      NOTE: exactly one -row option and one -col option must be used.

      If the input file does not have its indexes sorted in the correct
      ordering, this command may take longer than expected.  Specifying
      -transpose will transpose the input matrix before trying to put its
      values into the cifti file, which is currently needed for at least
      matrix2 in order to display it as intended.  How the cifti file is
      displayed is based on which -row option is specified: if -row-voxels is
      specified, then it will display data on volume slices.  The label names
      in the label volume(s) must have the following names, other names are
      ignored:


      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT


-scene-file-merge
REARRANGE SCENES INTO A NEW FILE
   wb_command -scene-file-merge
      <scene-file-out> - output - the output scene file

      [-scene-file] - repeatable - specify a scene file to use scenes from
         <scene-file> - the input scene file

         [-scene] - repeatable - specify a scene to use
            <scene> - the scene number or name

            [-up-to] - use an inclusive range of scenes
               <last-column> - the number or name of the last scene to include

               [-reverse] - use the range in reverse order

      Takes one or more scene files and constructs a new scene file by
      concatenating specified scenes from them.

      Example: wb_command -scene-file-merge out.scene -scene-file first.scene
      -scene 1 -scene-file second.scene

      This example would take the first scene from first.scene, followed by all
      scenes from second.scene, and write these scenes to out.scene.


-scene-file-relocate
RECREATE SCENE FILE IN NEW LOCATION
   wb_command -scene-file-relocate
      <input-scene> - the scene file to use
      <output-scene> - output - the new scene file to create

      Scene files contain internal relative paths, such that moving or copying
      a scene file will cause it to lose track of the files it refers to.  This
      command makes a modified copy of the scene file, changing the relative
      paths to refer to the new relative locations of the files.


-set-map-names
SET THE NAME OF ONE OR MORE MAPS IN A FILE
   wb_command -set-map-names
      <data-file> - the file to set the map names of

      [-name-file] - use a text file to replace all map names
         <file> - text file containing map names, one per line

      [-map] - repeatable - specify a map to set the name of
         <index> - the map index to change the name of
         <new-name> - the name to set for the map

      Sets the name of one or more maps for metric, shape, label, volume, cifti
      scalar or cifti label files.  If the -name-file option is not specified,
      the -map option must be specified at least once.  The -map option cannot
      be used when -name-file is specified.


-set-structure
SET STRUCTURE OF A DATA FILE
   wb_command -set-structure
      <data-file> - the file to set the structure of
      <structure> - the structure to set the file to

      [-surface-type] - set the type of a surface (only used if file is a
         surface file)
         <type> - name of surface type

      [-surface-secondary-type] - set the secondary type of a surface (only
         used if file is a surface file)
         <secondary type> - name of surface secondary type

      The existing file is modified and rewritten to the same filename.  Valid
      values for the structure name are:

      CORTEX_LEFT
      CORTEX_RIGHT
      CEREBELLUM
      ACCUMBENS_LEFT
      ACCUMBENS_RIGHT
      ALL_GREY_MATTER
      ALL_WHITE_MATTER
      AMYGDALA_LEFT
      AMYGDALA_RIGHT
      BRAIN_STEM
      CAUDATE_LEFT
      CAUDATE_RIGHT
      CEREBELLAR_WHITE_MATTER_LEFT
      CEREBELLAR_WHITE_MATTER_RIGHT
      CEREBELLUM_LEFT
      CEREBELLUM_RIGHT
      CEREBRAL_WHITE_MATTER_LEFT
      CEREBRAL_WHITE_MATTER_RIGHT
      CORTEX
      DIENCEPHALON_VENTRAL_LEFT
      DIENCEPHALON_VENTRAL_RIGHT
      HIPPOCAMPUS_LEFT
      HIPPOCAMPUS_RIGHT
      INVALID
      OTHER
      OTHER_GREY_MATTER
      OTHER_WHITE_MATTER
      PALLIDUM_LEFT
      PALLIDUM_RIGHT
      PUTAMEN_LEFT
      PUTAMEN_RIGHT
      THALAMUS_LEFT
      THALAMUS_RIGHT

      Valid names for the surface type are:

      UNKNOWN
      RECONSTRUCTION
      ANATOMICAL
      INFLATED
      VERY_INFLATED
      SPHERICAL
      SEMI_SPHERICAL
      ELLIPSOID
      FLAT
      HULL

      Valid names for the surface secondary type are:

      INVALID
      GRAY_WHITE
      MIDTHICKNESS
      PIAL


-show-scene
OFFSCREEN RENDERING OF SCENE TO AN IMAGE FILE
   wb_command -show-scene
      <scene-file> - scene file
      <scene-name-or-number> - name or number (starting at one) of the scene in
         the scene file
      <image-file-name> - output image file name
      <image-width> - width of output image(s)
      <image-height> - height of output image(s)

      [-use-window-size] - Override image size with window size

      [-no-scene-colors] - Do not use background and foreground colors in scene

      [-set-map-yoke] - Override selected map index for a map yoking group.
         <Map Yoking Roman Numeral> - Roman numeral identifying the map yoking
            group (I, II, III, IV, V, VI, VII, VIII, IX, X)
         <Map Index> - Map index for yoking group.  Indices start at 1 (one)

      [-conn-db-login] - Login for scenes with files in Connectome Database
         <Username> - Connectome DB Username
         <Password> - Connectome DB Password

      Render content of browser windows displayed in a scene into image
      file(s).  The image file name should be similar to "capture.png".  If
      there is only one image to render, the image name will not change.  If
      there is more than one image to render, an index will be inserted into
      the image name: "capture_01.png", "capture_02.png" etc.

      If the scene references files in the Connectome Database,
      the "-conn-db-login" option is available for providing the 
      username and password.  If this options is not specified, 
      the username and password stored in the user's preferences
      is used.

      The image format is determined by the image file extension.
      The available image formats may vary by operating system.
      Image formats available on this system are:
          bmp
          pbm
          pgm
          png
          ppm
          xbm
          xpm

      The result of using the "-use-window-size" option
      is dependent upon the version used to create the scene.
          * Versions 1.2 and newer contain the width and 
            height of the graphics region.  The output image  
            will be the width and height from the scene and
            the image width and height specified on the command
            line is ignored.
          * If the scene does not contain the width and height
            of the graphics region, the width and height specified
            on the command line is used for the size of the 
            output image.


-signed-distance-to-surface
COMPUTE SIGNED DISTANCE FROM ONE SURFACE TO ANOTHER
   wb_command -signed-distance-to-surface
      <surface-comp> - the comparison surface to measure the signed distance on
      <surface-ref> - the reference surface that defines the signed distance
         function
      <metric> - output - the output metric

      [-winding] - winding method for point inside surface test
         <method> - name of the method (default EVEN_ODD)

      Compute the signed distance function of the reference surface at every
      vertex on the comparison surface.  NOTE: this relation is NOT symmetric,
      the line from a vertex to the closest point on the 'ref' surface (the one
      that defines the signed distance function) will only align with the
      normal of the 'ref' surface.  Valid specifiers for winding methods are as
      follows:

      EVEN_ODD (default)
      NEGATIVE
      NONZERO
      NORMALS

      The NORMALS method uses the normals of triangles and edges, or the
      closest triangle hit by a ray from the point.  This method may be
      slightly faster, but is only reliable for a closed surface that does not
      cross through itself.  All other methods count entry (positive) and exit
      (negative) crossings of a vertical ray from the point, then counts as
      inside if the total is odd, negative, or nonzero, respectively.


-spec-file-merge
MERGE TWO SPEC FILES INTO ONE
   wb_command -spec-file-merge
      <spec-1> - first spec file to merge
      <spec-2> - second spec file to merge
      <out-spec> - output - output spec file

      The output spec file contains every file that is in either of the input
      spec files.


-spec-file-relocate
RECREATE SPEC FILE IN NEW LOCATION
   wb_command -spec-file-relocate
      <input-spec> - the spec file to use
      <output-spec> - output - the new spec file to create

      Spec files contain internal relative paths, such that moving or copying a
      spec file will cause it to lose track of the files it refers to.  This
      command makes a modified copy of the spec file, changing the relative
      paths to refer to the new relative locations of the files.


-surface-affine-regression
REGRESS THE AFFINE TRANSFORM BETWEEN SURFACES ON THE SAME MESH
   wb_command -surface-affine-regression
      <source> - the surface to warp
      <target> - the surface to match the coordinates of
      <affine-out> - output - the output affine file

      Use linear regression to compute an affine that minimizes the sum of
      squares of the coordinate differences between the target surface and the
      warped source surface.  Note that this has a bias to shrink the surface
      that is being warped.  The output is written as a NIFTI 'world' matrix,
      see -convert-affine to convert it for use in other software.


-surface-apply-affine
APPLY AFFINE TRANSFORM TO SURFACE FILE
   wb_command -surface-apply-affine
      <in-surf> - the surface to transform
      <affine> - the affine file
      <out-surf> - output - the output transformed surface

      [-flirt] - MUST be used if affine is a flirt affine
         <source-volume> - the source volume used when generating the affine
         <target-volume> - the target volume used when generating the affine

      For flirt matrices, you must use the -flirt option, because flirt
      matrices are not a complete description of the coordinate transform they
      represent.  If the -flirt option is not present, the affine must be a
      nifti 'world' affine, which can be obtained with the -convert-affine
      command, or aff_conv from the 4dfp suite.


-surface-apply-warpfield
APPLY WARPFIELD TO SURFACE FILE
   wb_command -surface-apply-warpfield
      <in-surf> - the surface to transform
      <warpfield> - the INVERSE warpfield
      <out-surf> - output - the output transformed surface

      [-fnirt] - MUST be used if using a fnirt warpfield
         <forward-warp> - the forward warpfield

      NOTE: warping a surface requires the INVERSE of the warpfield used to
      warp the volume it lines up with.  The header of the forward warp is
      needed by the -fnirt option in order to correctly interpret the
      displacements in the fnirt warpfield.

      If the -fnirt option is not present, the warpfield must be a nifti
      'world' warpfield, which can be obtained with the -convert-warpfield
      command.


-surface-average
AVERAGE SURFACE FILES TOGETHER
   wb_command -surface-average
      <surface-out> - output - the output averaged surface

      [-stddev] - compute 3D sample standard deviation
         <stddev-metric-out> - output - the output metric for 3D sample
            standard deviation

      [-uncertainty] - compute caret5 'uncertainty'
         <uncert-metric-out> - output - the output metric for uncertainty

      [-surf] - repeatable - specify a surface to include in the average
         <surface> - a surface file to average

         [-weight] - specify a weighted average
            <weight> - the weight to use (default 1)

      The 3D sample standard deviation is computed as
      'sqrt(sum(squaredlength(xyz - mean(xyz)))/(n - 1))'.

      Uncertainty is a legacy measure used in caret5, and is computed as
      'sum(length(xyz - mean(xyz)))/n'.

      When weights are used, the 3D sample standard deviation treats them as
      reliability weights.


-surface-closest-vertex
FIND CLOSEST SURFACE VERTEX TO COORDINATES
   wb_command -surface-closest-vertex
      <surface> - the surface to use
      <coord-list-file> - text file with coordinates
      <vertex-list-out> - output - the output text file with vertex numbers

      For each coordinate XYZ triple, find the closest vertex in the surface,
      and output its vertex number into a text file.  The input file should
      only use whitespace to separate coordinates (spaces, newlines, tabs), for
      instance:

      20 30 25
      30 -20 10


-surface-coordinates-to-metric
MAKE METRIC FILE OF SURFACE COORDINATES
   wb_command -surface-coordinates-to-metric
      <surface> - the surface to use the coordinates of
      <metric-out> - output - the output metric

      Puts the coordinates of the surface into a 3-map metric file, as x, y, z.


-surface-cortex-layer
CREATE SURFACE APPROXIMATING A CORTICAL LAYER
   wb_command -surface-cortex-layer
      <white-surface> - the white matter surface
      <pial-surface> - the pial surface
      <location> - what volume fraction to place the layer at
      <out-surface> - output - the output surface

      [-placement-out] - output the placement as a distance fraction from pial
         to white
         <placement-metric> - output - output metric

      The input surfaces must have vertex correspondence.  The output surface
      is generated by placing vertices between the two surfaces such that the
      enclosed volume within any small patch of the new and white surfaces is
      the given fraction of the volume of the same patch between the pial and
      white surfaces (i.e., specifying 0 would give the white surface, 1 would
      give the pial surface).  


-surface-create-sphere
GENERATE A SPHERE WITH CONSISTENT VERTEX AREAS
   wb_command -surface-create-sphere
      <num-vertices> - desired number of vertices
      <sphere-out> - output - the output sphere

      Generates a sphere by regularly dividing the triangles of an icosahedron,
      to come as close to the desired number of vertices as possible, and
      modifying it to have very similar vertex areas for all vertices.  To
      generate a pair of vertex-matched left and right spheres, use this
      command, then -surface-flip-lr to generate the other sphere, then
      -set-structure on each.  For example:

      $ wb_command -surface-create-sphere 6000 Sphere.6k.R.surf.gii
      $ wb_command -surface-flip-lr Sphere.6k.R.surf.gii Sphere.6k.L.surf.gii
      $ wb_command -set-structure Sphere.6k.R.surf.gii CORTEX_RIGHT
      $ wb_command -set-structure Sphere.6k.L.surf.gii CORTEX_LEFT


-surface-curvature
CALCULATE CURVATURE OF SURFACE
   wb_command -surface-curvature
      <surface> - the surface to compute the curvature of

      [-mean] - output mean curvature
         <mean-out> - output - mean curvature metric

      [-gauss] - output gaussian curvature
         <gauss-out> - output - gaussian curvature metric

      Compute the curvature of the surface, using the method from:
      Interactive Texture Mapping by J. Maillot, Yahia, and Verroust, 1993.
      ACM-0-98791-601-8/93/008


-surface-cut-resample
RESAMPLE A CUT SURFACE
   wb_command -surface-cut-resample
      <surface-in> - the surface file to resample
      <current-sphere> - a sphere surface with the mesh that the input surface
         is currently on
      <new-sphere> - a sphere surface that is in register with <current-sphere>
         and has the desired output mesh
      <surface-out> - output - the output surface file

      Resamples a surface file, given two spherical surfaces that are in
      register.  Barycentric resampling is used, because it is usually better
      for resampling surfaces, and because it is needed to figure out the new
      topology anyway.


-surface-distortion
MEASURE DISTORTION BETWEEN SURFACES
   wb_command -surface-distortion
      <surface-reference> - the reference surface
      <surface-distorted> - the distorted surface
      <metric-out> - output - the output distortion metric

      [-smooth] - smooth the area data
         <sigma> - the smoothing kernel sigma in mm

      [-caret5-method] - use the surface distortion method from caret5

      [-edge-method] - calculate distortion of edge lengths rather than areas

      [-local-affine-method] - calculate distortion by the local affines
         between triangles

      This command, when not using -caret5-method, -edge-method, or
      -local-affine-method, is equivalent to using -surface-vertex-areas on
      each surface, smoothing both output metrics with the GEO_GAUSS_EQUAL
      method on the surface they came from if -smooth is specified, and then
      using the formula 'ln(distorted/reference)/ln(2)' on the smoothed
      results.

      When using -caret5-method, it uses the surface distortion method from
      caret5, which takes the base 2 log of the ratio of tile areas, then
      averages those results at each vertex, and then smooths the result on the
      reference surface.

      When using -edge-method, the -smooth option is ignored, and the output at
      each vertex is the average of 'abs(ln(refEdge/distortEdge)/ln(2))' over
      all edges connected to the vertex.

      When using -local-affine-method, the -smooth option is ignored.  The
      output is two columns, the first is the area distortion ratio, and the
      second is anisotropic strain.  These are calculated by an affine
      transform between matching triangles, and then averaged across the
      triangles of a vertex.


-surface-flip-lr
MIRROR A SURFACE THROUGH THE YZ PLANE
   wb_command -surface-flip-lr
      <surface> - the surface to flip
      <surface-out> - output - the output flipped surface

      This command negates the x coordinate of each vertex, and flips the
      surface normals, so that you have a surface of opposite handedness with
      the same features and vertex correspondence, with normals consistent with
      the original surface.  That is, if the input surface has normals facing
      outward, the output surface will also have normals facing outward.


-surface-flip-normals
FLIP ALL TILES ON A SURFACE
   wb_command -surface-flip-normals
      <surface> - the surface to flip the normals of
      <surface-out> - output - the output surface

      Flips all triangles on a surface, resulting in surface normals being
      flipped the other direction (inward vs outward).  If you transform a
      surface with an affine that has negative determinant, or a warpfield that
      similarly flips the surface, you may end up with a surface that has
      normals pointing inwards, which may have display problems.  Using this
      command will solve that problem.


-surface-generate-inflated
SURFACE GENERATE INFLATED
   wb_command -surface-generate-inflated
      <anatomical-surface-in> - the anatomical surface
      <inflated-surface-out> - output - the output inflated surface
      <very-inflated-surface-out> - output - the output very inflated surface

      [-iterations-scale] - optional iterations scaling
         <iterations-scale-value> - iterations-scale value

      Generate inflated and very inflated surfaces. The output surfaces are
      'matched' (have same XYZ range) to the anatomical surface. In most cases,
      an iterations-scale of 1.0 (default) is sufficient.  However, if the
      surface contains a large number of vertices (150,000), try an
      iterations-scale of 2.5.


-surface-geodesic-distance
COMPUTE GEODESIC DISTANCE FROM ONE VERTEX TO THE ENTIRE SURFACE
   wb_command -surface-geodesic-distance
      <surface> - the surface to compute on
      <vertex> - the vertex to compute geodesic distance from
      <metric-out> - output - the output metric

      [-naive] - use only neighbors, don't crawl triangles (not recommended)

      [-limit] - stop at a certain distance
         <limit-mm> - distance in mm to stop at

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      Unless -limit is specified, computes the geodesic distance from the
      specified vertex to all others.  The result is output as a single column
      metric file, with a value of -1 for vertices that the distance was not
      computed for.

      The -corrected-areas option should be used when the input is a group
      average surface - group average surfaces have significantly less surface
      area than individual surfaces do, and therefore distances measured on
      them would be smaller than measuring them on individual surfaces.  In
      this case, the input to this option should be a group average of the
      output of -surface-vertex-areas for each subject.

      If -naive is not specified, the algorithm uses not just immediate
      neighbors, but also neighbors derived from crawling across pairs of
      triangles that share an edge.


-surface-geodesic-distance-all-to-all
COMPUTE GEODESIC DISTANCES FROM ALL VERTICES
   wb_command -surface-geodesic-distance-all-to-all
      <surface> - the surface to compute on
      <cifti-out> - output - single-hemisphere dconn containing the distances

      [-roi] - only output distances for vertices inside an ROI
         <roi-metric> - the ROI as a metric file

      [-limit] - stop at a specified distance
         <limit-mm> - distance in mm to stop at

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      [-naive] - use only neighbors, don't crawl triangles (not recommended)

      Computes geodesic distance from every vertex to every vertex, outputting
      a single-hemisphere dconn file.  If you are only interested in a few
      vertices, see -surface-geodesic-distance.  When -limit is specified, any
      vertex beyond the limit is assigned the value -1.

      The -roi option makes the output file smaller by not outputting distances
      to or from vertices outside the ROI, but paths are still allowed to go
      outside the ROI when finding distances to other vertices.

      The -corrected-areas option should be used when the input is a group
      average surface - group average surfaces have significantly less surface
      area than individual surfaces do, and therefore distances measured on
      them would be smaller than measuring them on individual surfaces.  In
      this case, the input to this option should be a group average of the
      output of -surface-vertex-areas for each subject.

      If -naive is not specified, the algorithm uses not just immediate
      neighbors, but also neighbors derived from crawling across pairs of
      triangles that share an edge.


-surface-geodesic-rois
DRAW GEODESIC LIMITED ROIS AT VERTICES
   wb_command -surface-geodesic-rois
      <surface> - the surface to draw on
      <limit> - geodesic distance limit from vertex, in mm
      <vertex-list-file> - a text file containing the vertices to draw ROIs
         around
      <metric-out> - output - the output metric

      [-gaussian] - generate a gaussian kernel instead of a flat ROI
         <sigma> - the sigma for the gaussian kernel, in mm

      [-overlap-logic] - how to handle overlapping ROIs, default ALLOW
         <method> - the method of resolving overlaps

      [-names] - name the columns from text file
         <name-list-file> - a text file containing column names, one per line

      [-corrected-areas] - vertex areas to use instead of computing them from
         the surface
         <area-metric> - the corrected vertex areas, as a metric

      For each vertex in the list file, a column in the output metric is
      created, and an ROI around that vertex is drawn in that column.  Each
      metric column will have zeros outside the geodesic distance spacified by
      <limit>, and by default will have a value of 1.0 inside it.  If the
      -gaussian option is specified, the values inside the ROI will instead
      form a gaussian with the specified value of sigma, normalized so that the
      sum of the nonzero values in the metric column is 1.0.  The <method>
      argument to -overlap-logic must be one of ALLOW, CLOSEST, or EXCLUDE.
      ALLOW is the default, and means that ROIs are treated independently and
      may overlap.  CLOSEST means that ROIs may not overlap, and that no ROI
      contains vertices that are closer to a different seed vertex.  EXCLUDE
      means that ROIs may not overlap, and that any vertex within range of more
      than one ROI does not belong to any ROI.


-surface-inflation
SURFACE INFLATION
   wb_command -surface-inflation
      <anatomical-surface-in> - the anatomical surface
      <surface-in> - the surface file to inflate
      <number-of-smoothing-cycles> - number of smoothing cycles
      <smoothing-strength> - smoothing strength (ranges [0.0 - 1.0])
      <smoothing-iterations> - smoothing iterations
      <inflation-factor> - inflation factor
      <surface-out> - output - output surface file

      Inflate a surface by performing cycles that consist of smoothing
      followed by inflation (to correct shrinkage caused by smoothing).


-surface-information
DISPLAY INFORMATION ABOUT A SURFACE
   wb_command -surface-information
      <Surface File> - Surface for which information is displayed

      Information about surface is displayed including vertices, 
      triangles, bounding box, and spacing.


-surface-match
SURFACE MATCH
   wb_command -surface-match
      <Match Surface File> - Match (Reference) Surface
      <Input Surface File> - File containing surface that will be transformed
      <Output Surface Name> - Surface File after transformation

      The Input Surface File will be transformed so that its coordinate ranges
      (bounding box) match that of the Match Surface File


-surface-modify-sphere
CHANGE RADIUS AND OPTIONALLY RECENTER A SPHERE
   wb_command -surface-modify-sphere
      <sphere-in> - the sphere to modify
      <radius> - the radius the output sphere should have
      <sphere-out> - output - the output sphere

      [-recenter] - recenter the sphere by means of the bounding box

      This command may be useful if you have used -surface-resample to resample
      a sphere, which can suffer from problems generally not present in
      -surface-sphere-project-unproject.  If the sphere should already be
      centered around the origin, using -recenter may still shift it slightly
      before changing the radius, which is likely to be undesireable.

      If <sphere-in> is not close to spherical, or not centered around the
      origin and -recenter is not used, a warning is printed.


-surface-normals
OUTPUT VERTEX NORMALS AS METRIC FILE
   wb_command -surface-normals
      <surface> - the surface to output the normals of
      <metric-out> - output - the normal vectors

      Computes the normal vectors of the surface file, and outputs them as a 3
      column metric file.


-surface-resample
RESAMPLE A SURFACE TO A DIFFERENT MESH
   wb_command -surface-resample
      <surface-in> - the surface file to resample
      <current-sphere> - a sphere surface with the mesh that the input surface
         is currently on
      <new-sphere> - a sphere surface that is in register with <current-sphere>
         and has the desired output mesh
      <method> - the method name
      <surface-out> - output - the output surface file

      [-area-surfs] - specify surfaces to do vertex area correction based on
         <current-area> - a relevant surface with <current-sphere> mesh
         <new-area> - a relevant surface with <new-sphere> mesh

      [-area-metrics] - specify vertex area metrics to do area correction based
         on
         <current-area> - a metric file with vertex areas for <current-sphere>
            mesh
         <new-area> - a metric file with vertex areas for <new-sphere> mesh

      Resamples a surface file, given two spherical surfaces that are in
      register.  If ADAP_BARY_AREA is used, exactly one of -area-surfs or
      -area-metrics must be specified.  This method is not generally
      recommended for surface resampling, but is provided for completeness.

      The BARYCENTRIC method is generally recommended for anatomical surfaces,
      in order to minimize smoothing.

      For cut surfaces (including flatmaps), use -surface-cut-resample.

      Instead of resampling a spherical surface, the
      -surface-sphere-project-unproject command is recommended.

      The <method> argument must be one of the following:

      ADAP_BARY_AREA
      BARYCENTRIC


-surface-set-coordinates
MODIFY COORDINATES OF A SURFACE
   wb_command -surface-set-coordinates
      <surface-in> - the surface to use for the topology
      <coord-metric> - the new coordinates, as a 3-column metric file
      <surface-out> - output - the new surface

      Takes the topology from an existing surface file, and uses values from a
      metric file as coordinates to construct a new surface file.

      See -surface-coordinates-to-metric for how to get surface coordinates as
      a metric file, such that you can then modify them via metric commands,
      etc.


-surface-smoothing
SURFACE SMOOTHING
   wb_command -surface-smoothing
      <surface-in> - the surface file to smooth
      <smoothing-strength> - smoothing strength (ranges [0.0 - 1.0])
      <smoothing-iterations> - smoothing iterations
      <surface-out> - output - output surface file

      Smooths a surface by averaging vertex coordinates with those of the
      neighboring vertices.


-surface-sphere-project-unproject
DEFORM A SPHERE ACCORDING TO A REGISTRATION
   wb_command -surface-sphere-project-unproject
      <sphere-in> - the sphere with the desired output mesh
      <sphere-project-to> - a sphere that aligns with sphere-in
      <sphere-unproject-from> - sphere-project-to deformed to the output space
      <sphere-out> - output - the output sphere

      Each vertex of <sphere-in> is projected to <sphere-project-to> to obtain
      barycentric weights, which are then used to unproject from
      <sphere-unproject-from>.  This results in a sphere with the topology of
      <sphere-in>, but coordinates shifted by the deformation between
      <sphere-project-to> and <sphere-unproject-from>.  <sphere-project-to> and
      <sphere-unproject-from> must have the same topology as each other, but
      <sphere-in> may have different topology.


-surface-to-surface-3d-distance
COMPUTE DISTANCE BETWEEN CORRESPONDING VERTICES
   wb_command -surface-to-surface-3d-distance
      <surface-comp> - the surface to compare to the reference
      <surface-ref> - the surface to use as the reference
      <dists-out> - output - the output distances

      [-vectors] - output the displacement vectors
         <vectors-out> - output - the output vectors

      Computes the vector difference between the vertices of each surface with
      the same index, as (comp - ref), and output the magnitudes, and
      optionally the displacement vectors.


-surface-vertex-areas
MEASURE SURFACE AREA EACH VERTEX IS RESPONSIBLE FOR
   wb_command -surface-vertex-areas
      <surface> - the surface to measure
      <metric> - output - the output metric

      Each vertex gets one third of the area of each triangle it is a part of.
      Units are mm^2.


-surface-wedge-volume
MEASURE PER-VERTEX VOLUME BETWEEN SURFACES
   wb_command -surface-wedge-volume
      <inner-surface> - the inner surface
      <outer-surface> - the outer surface
      <metric> - output - the output metric

      Compute the volume of each vertex's area from one surface to another.
      The surfaces must have vertex correspondence.


-unit-test
 

-volume-affine-resample
RESAMPLE VOLUME USING AFFINE TRANSFORM
   wb_command -volume-affine-resample
      <volume-in> - volume to resample
      <affine> - the affine file to apply
      <volume-space> - a volume file in the volume space you want for the
         output
      <method> - the resampling method
      <volume-out> - output - the output volume

      [-flirt] - MUST be used if affine is a flirt affine
         <source-volume> - the source volume used when generating the affine
         <target-volume> - the target volume used when generating the affine

      Resample a volume file with an affine transformation.  The recommended
      methods are CUBIC (cubic spline) for most data, and ENCLOSING_VOXEL for
      label data.  The parameter <method> must be one of:

      CUBIC
      ENCLOSING_VOXEL
      TRILINEAR


-volume-all-labels-to-rois
MAKE ROIS FROM ALL LABELS IN A VOLUME FRAME
   wb_command -volume-all-labels-to-rois
      <label-in> - the input volume label file
      <map> - the number or name of the label map to use
      <volume-out> - output - the output volume file

      The output volume has a frame for each label in the specified input
      frame, other than the ??? label, each of which contains an ROI of all
      voxels that are set to the corresponding label.


-volume-capture-plane
INTERPOLATE IMAGE FROM PLANE THROUGH VOLUME
   wb_command -volume-capture-plane
      <volume> - the volume file to interpolate from
      <subvolume> - the name or number of the subvolume to use
      <interp> - interpolation type
      <h-dim> - width of output image, in pixels
      <v-dim> - height of output image, in pixels
      <scale-min> - value to render as black
      <scale-max> - value to render as white
      <bottom-left-x> - x-coordinate of the bottom left of the output image
      <bottom-left-y> - y-coordinate of the bottom left of the output image
      <bottom-left-z> - z-coordinate of the bottom left of the output image
      <bottom-right-x> - x-coordinate of the bottom right of the output image
      <bottom-right-y> - y-coordinate of the bottom right of the output image
      <bottom-right-z> - z-coordinate of the bottom right of the output image
      <top-left-x> - x-coordinate of the top left of the output image
      <top-left-y> - y-coordinate of the top left of the output image
      <top-left-z> - z-coordinate of the top left of the output image
      <image> - output - the output image

      NOTE: If you want to generate an image with all of the capabilities of
      the GUI rendering, see -show-scene.

      Renders an image of an arbitrary plane through the volume file, with a
      simple linear grayscale palette.  The parameter <interp> must be one of:

      CUBIC
      ENCLOSING_VOXEL
      TRILINEAR


-volume-copy-extensions
COPY EXTENDED DATA TO ANOTHER VOLUME FILE
   wb_command -volume-copy-extensions
      <data-volume> - the volume file containing the voxel data to use
      <extension-volume> - the volume file containing the extensions to use
      <volume-out> - output - the output volume

      [-drop-unknown] - don't copy extensions that workbench doesn't understand

      This command copies the information in a volume file that isn't a
      critical part of the standard header or data matrix, e.g. map names,
      palette settings, label tables.  If -drop-unknown is not specified, it
      also copies similar kinds of information set by other software.


-volume-create
CREATE A BLANK VOLUME FILE
   wb_command -volume-create
      <i-dim> - length of first dimension
      <j-dim> - length of second dimension
      <k-dim> - length of third dimension
      <volume-out> - output - the output volume

      [-plumb] - set via axis order and spacing/offset
         <axis-order> - a string like 'XYZ' that specifies which index is along
            which spatial dimension
         <x-spacing> - change in x-coordinate from incrementing the relevant
            index
         <y-spacing> - change in y-coordinate from incrementing the relevant
            index
         <z-spacing> - change in z-coordinate from incrementing the relevant
            index
         <x-offset> - the x-coordinate of the first voxel
         <y-offset> - the y-coordinate of the first voxel
         <z-offset> - the z-coordinate of the first voxel

      [-sform] - set via a nifti sform
         <xi-spacing> - increase in x coordinate from incrementing the i index
         <xj-spacing> - increase in x coordinate from incrementing the j index
         <xk-spacing> - increase in x coordinate from incrementing the k index
         <x-offset> - x coordinate of first voxel
         <yi-spacing> - increase in y coordinate from incrementing the i index
         <yj-spacing> - increase in y coordinate from incrementing the j index
         <yk-spacing> - increase in y coordinate from incrementing the k index
         <y-offset> - y coordinate of first voxel
         <zi-spacing> - increase in z coordinate from incrementing the i index
         <zj-spacing> - increase in z coordinate from incrementing the j index
         <zk-spacing> - increase in z coordinate from incrementing the k index
         <z-offset> - z coordinate of first voxel

      Creates a volume file full of zeros.  Exactly one of -plumb or -sform
      must be specified.


-volume-dilate
DILATE A VOLUME FILE
   wb_command -volume-dilate
      <volume> - the volume to dilate
      <distance> - distance in mm to dilate
      <method> - dilation method to use
      <volume-out> - output - the output volume

      [-exponent] - use a different exponent in the weighting function
         <exponent> - exponent 'n' to use in (1 / (distance ^ n)) as the
            weighting function (default 2)

      [-bad-voxel-roi] - specify an roi of voxels to overwrite, rather than
         voxels with value zero
         <roi-volume> - volume file, positive values denote voxels to have
            their values replaced

      [-data-roi] - specify an roi of where there is data
         <roi-volume> - volume file, positive values denote voxels that have
            data

      [-subvolume] - select a single subvolume to dilate
         <subvol> - the subvolume number or name

      For all voxels that are designated as bad, if they neighbor a non-bad
      voxel with data or are within the specified distance of such a voxel,
      replace the value in the bad voxel with a value calculated from nearby
      non-bad voxels that have data, otherwise set the value to zero.  No
      matter how small <distance> is, dilation will always use at least the
      face neighbor voxels.

      By default, voxels that have data with the value 0 are bad, specify
      -bad-voxel-roi to only count voxels as bad if they are selected by the
      roi.  If -data-roi is not specified, all voxels are assumed to have data.

      Valid values for <method> are:

      NEAREST - use the value from the nearest good voxel
      WEIGHTED - use a weighted average based on distance


-volume-distortion
CALCULATE VOLUME WARPFIELD DISTORTION
   wb_command -volume-distortion
      <warpfield> - the warpfield to compute the distortion of
      <volume-out> - output - the output distortion measures

      [-fnirt] - MUST be used if using a fnirt warpfield
         <source-volume> - the source volume used when generating the warpfield

      [-circular] - use the circle-based formula for the anisotropic measure

      Calculates isotropic and anisotropic distortions in the volume warpfield.
      At each voxel, the gradient of the absolute warpfield is computed to
      obtain the local affine transforms for each voxel (jacobian matrices),
      and strain tensors are derived from them.  The isotropic component
      (volumetric expansion ratio) is the product of the three principal
      strains.  The default measure ('elongation') for the anisotropic
      component is the largest principal strain divided by the smallest.

      The -circular option instead calculates the anisotropic component by
      transforming the principal strains into log space, considering them as
      x-values of points on a circle 120 degrees apart, finds the circle's
      diameter, and transforms that back to a ratio.


-volume-erode
ERODE A VOLUME FILE
   wb_command -volume-erode
      <volume> - the volume to erode
      <distance> - distance in mm to erode
      <volume-out> - output - the output volume

      [-roi] - assume voxels outside this roi are nonzero
         <roi-volume> - volume file, positive values denote voxels that have
            data

      [-subvolume] - select a single subvolume to dilate
         <subvol> - the subvolume number or name

      Around each voxel with a value of zero, set surrounding voxels to zero.
      The surrounding voxels are all face neighbors and all voxels within the
      specified distance (center to center).


-volume-estimate-fwhm
ESTIMATE FWHM SMOOTHNESS OF A VOLUME
   wb_command -volume-estimate-fwhm
      <volume> - the input volume

      [-roi] - use only data within an ROI
         <roivol> - the volume to use as an ROI

      [-subvolume] - select a single subvolume to estimate smoothness of
         <subvol> - the subvolume number or name

      [-whole-file] - estimate for the whole file at once, not each subvolume
         separately

         [-demean] - subtract the mean image before estimating smoothness

      Estimates the smoothness of the input volume in X, Y, and Z directions
      separately, printing the estimates to standard output, in mm as FWHM.  If
      -subvolume or -whole-file are not specified, each subvolume is estimated
      and displayed separately.


-volume-extrema
FIND EXTREMA IN A VOLUME FILE
   wb_command -volume-extrema
      <volume-in> - volume file to find the extrema of
      <distance> - the minimum distance between identified extrema of the same
         type
      <volume-out> - output - the output extrema volume

      [-presmooth] - smooth the volume before finding extrema
         <kernel> - the sigma for the gaussian smoothing kernel, in mm

      [-roi] - ignore values outside the selected area
         <roi-volume> - the area to find extrema in

      [-threshold] - ignore small extrema
         <low> - the largest value to consider for being a minimum
         <high> - the smallest value to consider for being a maximum

      [-sum-subvols] - output the sum of the extrema subvolumes instead of each
         subvolume separately

      [-consolidate-mode] - use consolidation of local minima instead of a
         large neighborhood

      [-only-maxima] - only find the maxima

      [-only-minima] - only find the minima

      [-subvolume] - select a single subvolume to find extrema in
         <subvolume> - the subvolume number or name

      Finds extrema in a volume file, such that no two extrema of the same type
      are within <distance> of each other.  The extrema are labeled as -1 for
      minima, 1 for maxima, 0 otherwise.  If -only-maxima or -only-minima is
      specified, then it will ignore extrema not of the specified type.  These
      options are mutually exclusive.

      If -sum-subvols is specified, these extrema subvolumes are summed, and
      the output has a single subvolume with this result.

      By default, a datapoint is an extrema only if it is more extreme than
      every other datapoint that is within <distance> from it.  If
      -consolidate-mode is used, it instead starts by finding all datapoints
      that are more extreme than their immediate neighbors, then while there
      are any extrema within <distance> of each other, take the two extrema
      closest to each other and merge them into one by a weighted average based
      on how many original extrema have been merged into each.

      By default, all input subvolumes are used with no smoothing, use
      -subvolume to specify a single subvolume to use, and -presmooth to smooth
      the input before finding the extrema.


-volume-fill-holes
FILL HOLES IN AN ROI VOLUME
   wb_command -volume-fill-holes
      <volume-in> - the input ROI volume
      <volume-out> - output - the output ROI volume

      Finds all face-connected parts that are not included in the ROI, and
      fills all but the largest one with ones.


-volume-find-clusters
FILTER CLUSTERS BY VOLUME
   wb_command -volume-find-clusters
      <volume-in> - the input volume
      <value-threshold> - threshold for data values
      <minimum-volume> - threshold for cluster volume, in mm^3
      <volume-out> - output - the output volume

      [-less-than] - find values less than <value-threshold>, rather than
         greater

      [-roi] - select a region of interest
         <roi-volume> - the roi, as a volume file

      [-subvolume] - select a single subvolume
         <subvol> - the subvolume number or name

      [-size-ratio] - ignore clusters smaller than a given fraction of the
         largest cluster in map
         <ratio> - fraction of the largest cluster's volume

      [-distance] - ignore clusters further than a given distance from the
         largest cluster
         <distance> - how far from the largest cluster a cluster can be, edge
            to edge, in mm

      [-start] - start labeling clusters from a value other than 1
         <startval> - the value to give the first cluster found

      Outputs a volume with nonzero integers for all voxels within a large
      enough cluster, and zeros elsewhere.  The integers denote cluster
      membership (by default, first cluster found will use value 1, second
      cluster 2, etc).  By default, values greater than <value-threshold> are
      considered to be in a cluster, use -less-than to test for values less
      than the threshold.  To apply this as a mask to the data, or to do more
      complicated thresholding, see -volume-math.


-volume-gradient
GRADIENT OF A VOLUME FILE
   wb_command -volume-gradient
      <volume-in> - the input volume
      <volume-out> - output - the output gradient magnitude volume

      [-presmooth] - smooth the volume before computing the gradient
         <kernel> - sigma for gaussian weighting function, in mm

      [-roi] - select a region of interest to take the gradient of
         <roi-volume> - the region to take the gradient within

      [-vectors] - output vectors
         <vector-volume-out> - output - the vectors as a volume file

      [-subvolume] - select a single subvolume to take the gradient of
         <subvol> - the subvolume number or name

      Computes the gradient of the volume by doing linear regressions for each
      voxel, considering only its face neighbors unless too few face neighbors
      exist.  The gradient vector is constructed from the partial derivatives
      of the resulting linear function, and the magnitude of this vector is the
      output.  If specified, the volume vector output is arranged with the x,
      y, and z components from a subvolume as consecutive subvolumes.


-volume-label-export-table
EXPORT LABEL TABLE FROM VOLUME AS TEXT
   wb_command -volume-label-export-table
      <label-in> - the input volume label file
      <map> - the number or name of the label map to use
      <table-out> - output - the output text file

      Takes the label table from the volume label map, and writes it to a text
      format matching what is expected by -volume-label-import.


-volume-label-import
IMPORT A LABEL VOLUME TO WORKBENCH FORMAT
   wb_command -volume-label-import
      <input> - the input volume file
      <label-list-file> - text file containing the values and names for labels
      <output> - output - the output workbench label volume

      [-discard-others] - set any voxels with values not mentioned in the label
         list to the ??? label

      [-unlabeled-value] - set the value that will be interpreted as unlabeled
         <value> - the numeric value for unlabeled (default 0)

      [-subvolume] - select a single subvolume to import
         <subvol> - the subvolume number or name

      [-drop-unused-labels] - remove any unused label values from the label
         table

      Creates a new label volume from an integer-valued volume file.  The label
      name and color information is stored in the volume header in a nifti
      extension, with a similar format as in caret5, see -volume-help.  You may
      specify the empty string ('' will work on linux/mac) for
      <label-list-file>, which will be treated as if it is an empty file.  The
      label list file must have pairs of lines of the following format:

      <labelname>
      <value> <red> <green> <blue> <alpha>

      Do not specify the "unlabeled" key in the file, it is assumed that 0
      means not labeled unless -unlabeled-value is specified.  Label names must
      be on a separate line, but may contain spaces or other unusual characters
      (but not newline).  Whitespace is trimmed from both ends of the label
      name, but is kept if it is in the middle of a label.  The values of red,
      green, blue and alpha must be integers from 0 to 255, and will specify
      the color the label is drawn as (alpha of 255 means opaque, which is
      probably what you want).  By default, it will set new label names with
      names of LABEL_# for any values encountered that are not mentioned in the
      list file, specify -discard-others to instead set these voxels to the
      "unlabeled" key.


-volume-label-probability
FIND FREQUENCY OF VOLUME LABELS
   wb_command -volume-label-probability
      <label-maps> - volume label file containing individual label maps from
         many subjects
      <probability-out> - output - the relative frequencies of each label at
         each voxel

      [-exclude-unlabeled] - don't make a probability map of the unlabeled key

      This command outputs a set of soft ROIs, one for each label in the input,
      where the value is how many of the input maps had that label at that
      voxel, divided by the number of input maps.


-volume-label-to-roi
MAKE A VOLUME LABEL INTO AN ROI VOLUME
   wb_command -volume-label-to-roi
      <label-in> - the input volume label file
      <volume-out> - output - the output volume file

      [-name] - select label by name
         <label-name> - the label name that you want an roi of

      [-key] - select label by key
         <label-key> - the label key that you want an roi of

      [-map] - select a single label map to use
         <map> - the map number or name

      For each map in <label-in>, a map is created in <volume-out> where all
      locations labeled with <label-name> or with a key of <label-key> are
      given a value of 1, and all other locations are given 0.  Exactly one of
      -name and -key must be specified.  Specify -map to use only one map from
      <label-in>.


-volume-label-to-surface-mapping
MAP A LABEL VOLUME TO A SURFACE LABEL FILE
   wb_command -volume-label-to-surface-mapping
      <volume> - the volume to map data from
      <surface> - the surface to map the data onto
      <label-out> - output - the output gifti label file

      [-ribbon-constrained] - use ribbon constrained mapping algorithm
         <inner-surf> - the inner surface of the ribbon
         <outer-surf> - the outer surface of the ribbon

         [-volume-roi] - use a volume roi
            <roi-volume> - the volume file

         [-voxel-subdiv] - voxel divisions while estimating voxel weights
            <subdiv-num> - number of subdivisions, default 3

         [-thin-columns] - use non-overlapping polyhedra

      [-subvol-select] - select a single subvolume to map
         <subvol> - the subvolume number or name

      Map label volume data to a surface.  If -ribbon-constrained is not
      specified, uses the enclosing voxel method.  The ribbon mapping method
      constructs a polyhedron from the vertex's neighbors on each surface, and
      estimates the amount of this polyhedron's volume that falls inside any
      nearby voxels, to use as the weights for a popularity comparison.  If
      -thin-columns is specified, the polyhedron uses the edge midpoints and
      triangle centroids, so that neighboring vertices do not have overlapping
      polyhedra.  This may require increasing -voxel-subdiv to get enough
      samples in each voxel to reliably land inside these smaller polyhedra.
      The volume ROI is useful to exclude partial volume effects of voxels the
      surfaces pass through, and will cause the mapping to ignore voxels that
      don't have a positive value in the mask.  The subdivision number
      specifies how it approximates the amount of the volume the polyhedron
      intersects, by splitting each voxel into NxNxN pieces, and checking
      whether the center of each piece is inside the polyhedron.  If you have
      very large voxels, consider increasing this if you get unexpected
      unlabeled vertices in your output.


-volume-math
EVALUATE EXPRESSION ON VOLUME FILES
   wb_command -volume-math
      <expression> - the expression to evaluate, in quotes
      <volume-out> - output - the output volume

      [-fixnan] - replace NaN results with a value
         <replace> - value to replace NaN with

      [-var] - repeatable - a volume file to use as a variable
         <name> - the name of the variable, as used in the expression
         <volume> - the volume file to use as this variable

         [-subvolume] - select a single subvolume
            <subvol> - the subvolume number or name

         [-repeat] - reuse a single subvolume for each subvolume of calculation

      This command evaluates <expression> at each voxel independently.  There
      must be at least one -var option (to get the volume space from), even if
      the <name> specified in it isn't used in <expression>.  All volumes must
      have the same volume space.  Filenames are not valid in <expression>, use
      a variable name and a -var option with matching <name> to specify an
      input file.  If the -subvolume option is given to any -var option, only
      one subvolume is used from that file.  If -repeat is specified, the file
      must either have only one subvolume, or have the -subvolume option
      specified.  All files that don't use -repeat must have the same number of
      subvolumes requested to be used.  The format of <expression> is as
      follows:

      Expressions consist of constants, variables, operators, parentheses, and
      functions, in infix notation, such as 'exp(-x + 3) * scale'.  Variables
      are strings of any length, using the characters a-z, A-Z, 0-9, and _, but
      may not take the name of a named constant.  Currently, there is only one
      named constant, PI.  The operators are +, -, *, /, ^, >, <, >=, <=, ==,
      !=, !, &&, ||.  These behave as in C, except that ^ is exponentiation,
      i.e. pow(x, y), and takes higher precedence than other binary operators
      (also, '-3^-4^-5' means '-(3^(-(4^-5)))').  The <=, >=, ==, and !=
      operators are given a small amount of wiggle room, equal to one millionth
      of the smaller of the absolute values of the values being compared.

      Comparison and logical operators return 0 or 1, you can do masking with
      expressions like 'x * (mask > 0)'.  For all logical operators, an input
      is considered true iff it is greater than 0.  The expression '0 < x < 5'
      is not syntactically wrong, but it will NOT do what is desired, because
      it is evaluated left to right, i.e. '((0 < x) < 5)', which will always
      return 1, as both possible results of a comparison are less than 5.  A
      warning is generated if an expression of this type is detected.  Use
      something like 'x > 0 && x < 5' to get the desired behavior.

      Whitespace between elements is ignored, ' sin ( 2 * x ) ' is equivalent
      to 'sin(2*x)', but 's in(2*x)' is an error.  Implied multiplication is
      not allowed, the expression '2x' will be parsed as a variable.
      Parentheses are (), do not use [] or {}.  Functions require parentheses,
      the expression 'sin x' is an error.

      The following functions are supported:

         sin: 1 argument, the sine of the argument (units are radians)
         cos: 1 argument, the cosine of the argument (units are radians)
         tan: 1 argument, the tangent of the argument (units are radians)
         asin: 1 argument, the inverse of sine of the argument, in radians
         acos: 1 argument, the inverse of cosine of the argument, in radians
         atan: 1 argument, the inverse of tangent of the argument, in radians
         atan2: 2 arguments, atan2(y, x) returns the inverse of tangent of
      (y/x), in radians, determining quadrant by the sign of both arguments
         sinh: 1 argument, the hyperbolic sine of the argument
         cosh: 1 argument, the hyperbolic cosine of the argument
         tanh: 1 argument, the hyperboloc tangent of the argument
         asinh: 1 argument, the inverse hyperbolic sine of the argument
         acosh: 1 argument, the inverse hyperbolic cosine of the argument
         atanh: 1 argument, the inverse hyperboloc tangent of the argument
         ln: 1 argument, the natural logarithm of the argument
         exp: 1 argument, the constant e raised to the power of the argument
         log: 1 argument, the base 10 logarithm of the argument
         sqrt: 1 argument, the square root of the argument
         abs: 1 argument, the absolute value of the argument
         floor: 1 argument, the largest integer not greater than the argument
         round: 1 argument, the nearest integer, with ties rounded away from
      zero
         ceil: 1 argument, the smallest integer not less than the argument
         min: 2 arguments, min(x, y) returns y if (x > y), x otherwise
         max: 2 arguments, max(x, y) returns y if (x < y), x otherwise
         mod: 2 arguments, mod(x, y) = x - y * floor(x / y), or 0 if y == 0
         clamp: 3 arguments, clamp(x, low, high) = min(max(x, low), high)


-volume-merge
MERGE VOLUME FILES INTO A NEW FILE
   wb_command -volume-merge
      <volume-out> - output - the output volume file

      [-volume] - repeatable - specify an input volume file
         <volume-in> - a volume file to use subvolumes from

         [-subvolume] - repeatable - select a single subvolume to use
            <subvol> - the subvolume number or name

            [-up-to] - use an inclusive range of subvolumes
               <last-subvol> - the number or name of the last subvolume to
                  include

               [-reverse] - use the range in reverse order

      Takes one or more volume files and constructs a new volume file by
      concatenating subvolumes from them.  The input volume files must have the
      same volume space.

      Example: wb_command -volume-merge out.nii -volume first.nii -subvolume 1
      -volume second.nii

      This example would take the first subvolume from first.nii, followed by
      all subvolumes from second.nii, and write these to out.nii.


-volume-palette
SET THE PALETTE OF A VOLUME FILE
   wb_command -volume-palette
      <volume> - the volume file to modify
      <mode> - the mapping mode

      [-subvolume] - select a single subvolume
         <subvolume> - the subvolume number or name

      [-pos-percent] - percentage min/max for positive data coloring
         <pos-min-%> - the percentile for the least positive data
         <pos-max-%> - the percentile for the most positive data

      [-neg-percent] - percentage min/max for negative data coloring
         <neg-min-%> - the percentile for the least negative data
         <neg-max-%> - the percentile for the most negative data

      [-pos-user] - user min/max values for positive data coloring
         <pos-min-user> - the value for the least positive data
         <pos-max-user> - the value for the most positive data

      [-neg-user] - user min/max values for negative data coloring
         <neg-min-user> - the value for the least negative data
         <neg-max-user> - the value for the most negative data

      [-interpolate] - interpolate colors
         <interpolate> - boolean, whether to interpolate

      [-disp-pos] - display positive data
         <display> - boolean, whether to display

      [-disp-neg] - display positive data
         <display> - boolean, whether to display

      [-disp-zero] - display data closer to zero than the min cutoff
         <display> - boolean, whether to display

      [-palette-name] - set the palette used
         <name> - the name of the palette

      [-thresholding] - set the thresholding
         <type> - thresholding setting
         <test> - show values inside or outside thresholds
         <min> - lower threshold
         <max> - upper threshold

      [-inversion] - specify palette inversion
         <type> - the type of inversion

      The original volume file is overwritten with the modified version.  By
      default, all columns of the volume file are adjusted to the new settings,
      use the -subvolume option to change only one subvolume.  Mapping settings
      not specified in options will be taken from the first subvolume.  The
      <mode> argument must be one of the following:

      MODE_AUTO_SCALE
      MODE_AUTO_SCALE_ABSOLUTE_PERCENTAGE
      MODE_AUTO_SCALE_PERCENTAGE
      MODE_USER_SCALE

      The <name> argument to -palette-name must be one of the following:

      ROY-BIG-BL
      videen_style
      Gray_Interp_Positive
      Gray_Interp
      PSYCH-FIXED
      RBGYR20
      RBGYR20P
      RYGBR4_positive
      RGRBR_mirror90_pos
      Orange-Yellow
      POS_NEG_ZERO
      red-yellow
      blue-lightblue
      FSL
      power_surf
      fsl_red
      fsl_green
      fsl_blue
      fsl_yellow
      RedWhiteBlue
      cool-warm
      spectral
      RY-BC-BL
      magma
      JET256
      PSYCH
      PSYCH-NO-NONE
      ROY-BIG
      clear_brain
      fidl
      raich4_clrmid
      raich6_clrmid
      HSB8_clrmid
      POS_NEG

      The <type> argument to -thresholding must be one of the following:

      THRESHOLD_TYPE_OFF
      THRESHOLD_TYPE_NORMAL
      THRESHOLD_TYPE_FILE

      The <test> argument to -thresholding must be one of the following:

      THRESHOLD_TEST_SHOW_OUTSIDE
      THRESHOLD_TEST_SHOW_INSIDE

      The <type> argument to -inversion must be one of the following:

      OFF
      POSITIVE_WITH_NEGATIVE
      POSITIVE_NEGATIVE_SEPARATE


-volume-parcel-resampling
SMOOTH AND RESAMPLE VOLUME PARCELS
   wb_command -volume-parcel-resampling
      <volume-in> - the input data volume
      <cur-parcels> - label volume of where the parcels currently are
      <new-parcels> - label volume of where the parcels should be
      <kernel> - gaussian kernel sigma to smooth by during resampling
      <volume-out> - output - output volume

      [-fix-zeros] - treat zero values as not being data

      [-subvolume] - select a single subvolume as input
         <subvol> - the subvolume number or name

      Smooths and resamples the region inside each label in cur-parcels to the
      region of the same label name in new-parcels.  Any voxels in the output
      label region but outside the input label region will be extrapolated from
      nearby data.  The -fix-zeros option causes the smoothing to not use an
      input value if it is zero, but still write a smoothed value to the voxel,
      and after smoothing is complete, it will check for any remaining values
      of zero, and fill them in with extrapolated values.

      Note: all volumes must have the same dimensions and spacing.  To use a
      different output space, see -volume-parcel-resampling-generic.


-volume-parcel-resampling-generic
SMOOTH AND RESAMPLE VOLUME PARCELS FROM DIFFERENT VOLUME SPACE
   wb_command -volume-parcel-resampling-generic
      <volume-in> - the input data volume
      <cur-parcels> - label volume of where the parcels currently are
      <new-parcels> - label volume of where the parcels should be
      <kernel> - gaussian kernel sigma to smooth by during resampling
      <volume-out> - output - output volume

      [-fix-zeros] - treat zero values as not being data

      [-subvolume] - select a single subvolume as input
         <subvol> - the subvolume number or name

      Smooths and resamples the region inside each label in cur-parcels to the
      region of the same label name in new-parcels.  Any voxels in the output
      label region but outside the input label region will be extrapolated from
      nearby data.  The -fix-zeros option causes the smoothing to not use an
      input value if it is zero, but still write a smoothed value to the voxel,
      and after smoothing is complete, it will check for any remaining values
      of zero, and fill them in with extrapolated values.  The output volume
      will use the volume space of new-parcels, which does not need to be in
      the same volume space as the input.


-volume-parcel-smoothing
SMOOTH PARCELS IN A VOLUME SEPARATELY
   wb_command -volume-parcel-smoothing
      <data-volume> - the volume to smooth
      <label-volume> - a label volume containing the parcels to smooth
      <kernel> - the gaussian smoothing kernel sigma, in mm
      <volume-out> - output - the output volume

      [-fix-zeros] - treat zero values as not being data

      [-subvolume] - select a single subvolume to smooth
         <subvol> - the subvolume number or name

      The volume is smoothed within each label in the label volume using data
      only from within the label.  Equivalent to running volume smoothing with
      ROIs matching each label separately, then adding the resulting volumes,
      but faster.


-volume-reduce
PERFORM REDUCTION OPERATION ACROSS SUBVOLUMES
   wb_command -volume-reduce
      <volume-in> - the volume file to reduce
      <operation> - the reduction operator to use
      <volume-out> - output - the output volume

      [-exclude-outliers] - exclude non-numeric values and outliers by standard
         deviation
         <sigma-below> - number of standard deviations below the mean to
            include
         <sigma-above> - number of standard deviations above the mean to
            include

      [-only-numeric] - exclude non-numeric values

      For each voxel, takes the data across subvolumes as a vector, and
      performs the specified reduction on it, putting the result into the
      single output volume at that voxel.  The reduction operators are as
      follows:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data


-volume-remove-islands
REMOVE ISLANDS FROM AN ROI VOLUME
   wb_command -volume-remove-islands
      <volume-in> - the input ROI volume
      <volume-out> - output - the output ROI volume

      Finds all face-connected parts of the ROI, and zeros out all but the
      largest one.


-volume-reorient
CHANGE VOXEL ORDER OF A VOLUME FILE
   wb_command -volume-reorient
      <volume> - the volume to reorient
      <orient-string> - the desired orientation
      <volume-out> - out - the reoriented volume

      Changes the voxel order and the header spacing/origin information such
      that the value of any spatial point is unchanged.  Orientation strings
      look like 'LPI', which means first index is left to right, second is
      posterior to anterior, and third is inferior to superior.  The valid
      characters are:

      L      left to right
      R      right to left
      P      posterior to anterior
      A      anterior to posterior
      I      inferior to superior
      S      superior to inferior


-volume-rois-from-extrema
CREATE VOLUME ROI MAPS FROM EXTREMA MAPS
   wb_command -volume-rois-from-extrema
      <volume-in> - the input volume
      <limit> - distance limit from voxel center, in mm
      <volume-out> - output - the output volume

      [-gaussian] - generate a gaussian kernel instead of a flat ROI
         <sigma> - the sigma for the gaussian kernel, in mm

      [-roi] - select a region of interest to use
         <roi-volume> - the region to use

      [-overlap-logic] - how to handle overlapping ROIs, default ALLOW
         <method> - the method of resolving overlaps

      [-subvolume] - select a single subvolume to take the gradient of
         <subvol> - the subvolume number or name

      For each nonzero value in each map, make a map with an ROI around that
      location.  If the -gaussian option is specified, then normalized gaussian
      kernels are output instead of ROIs.  The <method> argument to
      -overlap-logic must be one of ALLOW, CLOSEST, or EXCLUDE.  ALLOW is the
      default, and means that ROIs are treated independently and may overlap.
      CLOSEST means that ROIs may not overlap, and that no ROI contains
      vertices that are closer to a different seed vertex.  EXCLUDE means that
      ROIs may not overlap, and that any vertex within range of more than one
      ROI does not belong to any ROI.


-volume-set-space
CHANGE VOLUME SPACE INFORMATION
   wb_command -volume-set-space
      <volume-in> - the input volume
      <volume-out> - output - the output volume

      [-plumb] - set via axis order and spacing/offset
         <axis-order> - a string like 'XYZ' that specifies which index is along
            which spatial dimension
         <x-spacing> - change in x-coordinate from incrementing the relevant
            index
         <y-spacing> - change in y-coordinate from incrementing the relevant
            index
         <z-spacing> - change in z-coordinate from incrementing the relevant
            index
         <x-offset> - the x-coordinate of the first voxel
         <y-offset> - the y-coordinate of the first voxel
         <z-offset> - the z-coordinate of the first voxel

      [-sform] - set via a nifti sform
         <xi-spacing> - increase in x coordinate from incrementing the i index
         <xj-spacing> - increase in x coordinate from incrementing the j index
         <xk-spacing> - increase in x coordinate from incrementing the k index
         <x-offset> - x coordinate of first voxel
         <yi-spacing> - increase in y coordinate from incrementing the i index
         <yj-spacing> - increase in y coordinate from incrementing the j index
         <yk-spacing> - increase in y coordinate from incrementing the k index
         <y-offset> - y coordinate of first voxel
         <zi-spacing> - increase in z coordinate from incrementing the i index
         <zj-spacing> - increase in z coordinate from incrementing the j index
         <zk-spacing> - increase in z coordinate from incrementing the k index
         <z-offset> - z coordinate of first voxel

      [-file] - copy spacing info from volume file with matching dimensions
         <volume-ref> - volume file to use for reference space

         [-ignore-dims] - copy the spacing info even if the dimensions don't
            match

      Writes a copy of the volume file, with the spacing information changed as
      specified.  No reordering of the voxel data occurs, see -volume-reorient
      to change the volume indexing order and reorder the voxels to match.
      Exactly one of -plumb, -sform, or -file must be specified.


-volume-smoothing
SMOOTH A VOLUME FILE
   wb_command -volume-smoothing
      <volume-in> - the volume to smooth
      <kernel> - the gaussian smoothing kernel sigma, in mm
      <volume-out> - output - the output volume

      [-roi] - smooth only from data within an ROI
         <roivol> - the volume to use as an ROI

      [-fix-zeros] - treat zero values as not being data

      [-subvolume] - select a single subvolume to smooth
         <subvol> - the subvolume number or name

      Gaussian smoothing for volumes.  By default, smooths all subvolumes with
      no ROI, if ROI is given, only positive voxels in the ROI volume have
      their values used, and all other voxels are set to zero.  Smoothing a
      non-orthogonal volume will be significantly slower, because the operation
      cannot be separated into 1-dimensional smoothings without distorting the
      kernel shape.

      The -fix-zeros option causes the smoothing to not use an input value if
      it is zero, but still write a smoothed value to the voxel.  This is
      useful for zeros that indicate lack of information, preventing them from
      pulling down the intensity of nearby voxels, while giving the zero an
      extrapolated value.


-volume-stats
SPATIAL STATISTICS ON A VOLUME FILE
   wb_command -volume-stats
      <volume-in> - the input volume

      [-reduce] - use a reduction operation
         <operation> - the reduction operation

      [-percentile] - give the value at a percentile
         <percent> - the percentile to find

      [-subvolume] - only display output for one subvolume
         <subvolume> - the subvolume number or name

      [-roi] - only consider data inside an roi
         <roi-volume> - the roi, as a volume file

         [-match-maps] - each subvolume of input uses the corresponding
            subvolume from the roi file

      [-show-map-name] - print map index and name before each output

      For each subvolume of the input, a single number is printed, resulting
      from the specified reduction or percentile operation.  Use -subvolume to
      only give output for a single subvolume.  Use -roi to consider only the
      data within a region.  Exactly one of -reduce or -percentile must be
      specified.

      The argument to the -reduce option must be one of the following:

      MAX: the maximum value
      MIN: the minimum value
      INDEXMAX: the 1-based index of the maximum value
      INDEXMIN: the 1-based index of the minimum value
      SUM: add all values
      PRODUCT: multiply all values
      MEAN: the mean of the data
      STDEV: the standard deviation (N denominator)
      SAMPSTDEV: the sample standard deviation (N-1 denominator)
      VARIANCE: the variance of the data
      TSNR: mean divided by sample standard deviation (N-1 denominator)
      COV: sample standard deviation (N-1 denominator) divided by mean
      MEDIAN: the median of the data
      MODE: the mode of the data
      COUNT_NONZERO: the number of nonzero elements in the data


-volume-tfce
DO TFCE ON A VOLUME FILE
   wb_command -volume-tfce
      <volume-in> - the volume to run TFCE on
      <volume-out> - output - the output volume

      [-presmooth] - smooth the volume before running TFCE
         <kernel> - the sigma for the gaussian smoothing kernel, in mm

      [-roi] - select a region of interest to run TFCE on
         <roi-volume> - the area to run TFCE on, as a volume

      [-parameters] - set parameters for TFCE integral
         <E> - exponent for cluster volume (default 0.5)
         <H> - exponent for threshold value (default 2.0)

      [-subvolume] - select a single subvolume
         <subvolume> - the subvolume number or name

      Threshold-free cluster enhancement is a method to increase the relative
      value of regions that would form clusters in a standard thresholding
      test.  This is accomplished by evaluating the integral of:

      e(h, p)^E * h^H * dh

      at each vertex p, where h ranges from 0 to the maximum value in the data,
      and e(h, p) is the extent of the cluster containing vertex p at threshold
      h.  Negative values are similarly enhanced by negating the data, running
      the same process, and negating the result.

      This method is explained in: Smith SM, Nichols TE., "Threshold-free
      cluster enhancement: addressing problems of smoothing, threshold
      dependence and localisation in cluster inference." Neuroimage. 2009 Jan
      1;44(1):83-98. PMID: 18501637


-volume-to-surface-mapping
MAP VOLUME TO SURFACE
   wb_command -volume-to-surface-mapping
      <volume> - the volume to map data from
      <surface> - the surface to map the data onto
      <metric-out> - output - the output metric file

      [-trilinear] - use trilinear volume interpolation

      [-enclosing] - use value of the enclosing voxel

      [-cubic] - use cubic splines

      [-ribbon-constrained] - use ribbon constrained mapping algorithm
         <inner-surf> - the inner surface of the ribbon
         <outer-surf> - the outer surface of the ribbon

         [-volume-roi] - use a volume roi
            <roi-volume> - the volume file

         [-voxel-subdiv] - voxel divisions while estimating voxel weights
            <subdiv-num> - number of subdivisions, default 3

         [-thin-columns] - use non-overlapping polyhedra

         [-gaussian] - reduce weight to voxels that aren't near <surface>
            <scale> - value to multiply the local thickness by, to get the
               gaussian sigma

         [-output-weights] - write the voxel weights for a vertex to a volume
            file
            <vertex> - the vertex number to get the voxel weights for, 0-based
            <weights-out> - output - volume to write the weights to

         [-output-weights-text] - write the voxel weights for all vertices to a
            text file
            <text-out> - output - the output text filename

      [-myelin-style] - use the method from myelin mapping
         <ribbon-roi> - an roi volume of the cortical ribbon for this
            hemisphere
         <thickness> - a metric file of cortical thickness
         <sigma> - gaussian kernel in mm for weighting voxels within range

         [-legacy-bug] - emulate old v1.2.3 and earlier code that didn't follow
            a cylinder cutoff

      [-subvol-select] - select a single subvolume to map
         <subvol> - the subvolume number or name

      You must specify exactly one mapping method.  Enclosing voxel uses the
      value from the voxel the vertex lies inside, while trilinear does a 3D
      linear interpolation based on the voxels immediately on each side of the
      vertex's position.

      The ribbon mapping method constructs a polyhedron from the vertex's
      neighbors on each surface, and estimates the amount of this polyhedron's
      volume that falls inside any nearby voxels, to use as the weights for
      sampling.  If -thin-columns is specified, the polyhedron uses the edge
      midpoints and triangle centroids, so that neighboring vertices do not
      have overlapping polyhedra.  This may require increasing -voxel-subdiv to
      get enough samples in each voxel to reliably land inside these smaller
      polyhedra.  The volume ROI is useful to exclude partial volume effects of
      voxels the surfaces pass through, and will cause the mapping to ignore
      voxels that don't have a positive value in the mask.  The subdivision
      number specifies how it approximates the amount of the volume the
      polyhedron intersects, by splitting each voxel into NxNxN pieces, and
      checking whether the center of each piece is inside the polyhedron.  If
      you have very large voxels, consider increasing this if you get zeros in
      your output.  The -gaussian option makes it act more like the myelin
      method, where the distance of a voxel from <surface> is used to
      downweight the voxel.

      The myelin style method uses part of the caret5 myelin mapping command to
      do the mapping: for each surface vertex, take all voxels that are in a
      cylinder with radius and height equal to cortical thickness, centered on
      the vertex and aligned with the surface normal, and that are also within
      the ribbon ROI, and apply a gaussian kernel with the specified sigma to
      them to get the weights to use.  The -legacy-bug flag reverts to the
      unintended behavior present from the initial implementation up to and
      including v1.2.3, which had only the tangential cutoff and a bounding box
      intended to be larger than where the cylinder cutoff should have been.


-volume-vector-operation
DO A VECTOR OPERATION ON VOLUME FILES
   wb_command -volume-vector-operation
      <vectors-a> - first vector input file
      <vectors-b> - second vector input file
      <operation> - what vector operation to do
      <volume-out> - output - the output file

      [-normalize-a] - normalize vectors of first input

      [-normalize-b] - normalize vectors of second input

      [-normalize-output] - normalize output vectors (not valid for dot
         product)

      [-magnitude] - output the magnitude of the result (not valid for dot
         product)

      Does a vector operation on two volume files (that must have a multiple of
      3 subvolumes).  Either of the inputs may have multiple vectors (more than
      3 subvolumes), but not both (at least one must have exactly 3
      subvolumes).  The -magnitude and -normalize-output options may not be
      specified together, or with the DOT operation.  The <operation> parameter
      must be one of the following:

      DOT
      CROSS
      ADD
      SUBTRACT


-volume-warpfield-affine-regression
REGRESS AFFINE FROM WARPFIELD
   wb_command -volume-warpfield-affine-regression
      <warpfield> - the input warpfield
      <affine-out> - output - the output affine file

      [-roi] - only consider voxels within a mask (e.g., a brain mask)
         <roi-vol> - the mask volume

      [-fnirt] - input is a fnirt warpfield
         <source-volume> - the source volume used when generating the fnirt
            warpfield

      [-flirt-out] - write output as a flirt matrix rather than a world
         coordinate transform
         <source-volume> - the volume you want to apply the transform to
         <target-volume> - the target space you want the transformed volume to
            match

      For all voxels in the warpfield, do a regression that predicts the
      post-warp coordinate from the source coordinate.  When -roi is specified,
      only consider voxels with a value greater than 0 in <roi-vol>.

      The default is to expect the warpfield to be in relative world
      coordinates (mm space), and to write the output as a world affine (mm
      space to mm space).  If you are using FSL-created files and utilities,
      specify -fnirt and -flirt as needed, as their coordinate conventions are
      different.


-volume-warpfield-resample
RESAMPLE VOLUME USING WARPFIELD
   wb_command -volume-warpfield-resample
      <volume-in> - volume to resample
      <warpfield> - the warpfield to apply
      <volume-space> - a volume file in the volume space you want for the
         output
      <method> - the resampling method
      <volume-out> - output - the output volume

      [-fnirt] - MUST be used if using a fnirt warpfield
         <source-volume> - the source volume used when generating the warpfield

      Resample a volume file with a warpfield.  The recommended methods are
      CUBIC (cubic spline) for most data, and ENCLOSING_VOXEL for label data.
      The parameter <method> must be one of:

      CUBIC
      ENCLOSING_VOXEL
      TRILINEAR


-volume-weighted-stats
WEIGHTED SPATIAL STATISTICS ON A VOLUME FILE
   wb_command -volume-weighted-stats
      <volume-in> - the input volume

      [-weight-volume] - use weights from a volume file
         <weight-volume> - volume file containing the weights

         [-match-maps] - each subvolume of input uses the corresponding
            subvolume from the weights file

      [-subvolume] - only display output for one subvolume
         <subvolume> - the subvolume number or name

      [-roi] - only consider data inside an roi
         <roi-volume> - the roi, as a volume file

         [-match-maps] - each subvolume of input uses the corresponding
            subvolume from the roi file

      [-mean] - compute weighted mean

      [-stdev] - compute weighted standard deviation

         [-sample] - estimate population stdev from the sample

      [-percentile] - compute weighted percentile
         <percent> - the percentile to find

      [-sum] - compute weighted sum

      [-show-map-name] - print map index and name before each output

      For each subvolume of the input, a single number is printed, resulting
      from the specified operation.  If -weight-volume is not specified, each
      voxel's volume is used.  Use -subvolume to only give output for a single
      subvolume.  Use -roi to consider only the data within a region.  Exactly
      one of -mean, -stdev, -percentile or -sum must be specified.

      Using -sum without -weight-volume is equivalent to integrating with
      respect to volume.


-wbsparse-merge-dense
MERGE WBSPARSE FILES ALONG DENSE DIMENSION
   wb_command -wbsparse-merge-dense
      <direction> - which dimension to merge along, ROW or COLUMN
      <wbsparse-out> - output - the output wbsparse file

      [-wbsparse] - repeatable - specify an input wbsparse file
         <wbsparse-in> - a wbsparse file to merge

      The input wbsparse files must have matching mappings along the direction
      not specified, and the mapping along the specified direction must be
      brain models.


-zip-scene-file
ZIP A SCENE FILE AND ITS DATA FILES
   wb_command -zip-scene-file
      <scene-file> - the scene file to make the zip file from
      <extract-folder> - the name of the folder created when the zip file is
         unzipped
      <zip-file> - out - the zip file that will be created

      [-base-dir] - specify a directory that all data files are somewhere
         within, this will become the root of the zipfile's directory structure
         <directory> - the directory

      If zip-file already exists, it will be overwritten.  If -base-dir is not
      specified, the base directory will be automatically set to the lowest
      level directory containing all files.  The scene file must contain only
      relative paths, and no data files may be outside the base directory.


-zip-spec-file
ZIP A SPEC FILE AND ITS DATA FILES
   wb_command -zip-spec-file
      <spec-file> - the specification file to add to zip file
      <extract-folder> - the name of the folder created when the zip file is
         unzipped
      <zip-file> - out - the zip file that will be created

      [-base-dir] - specify a directory that all data files are somewhere
         within, this will become the root of the zipfile's directory structure
         <directory> - the directory

      If zip-file already exists, it will be overwritten.  If -base-dir is not
      specified, the directory containing the spec file is used for the base
      directory.  The spec file must contain only relative paths, and no data
      files may be outside the base directory.  Scene files inside spec files
      are not checked for what files they reference, ensure that all data files
      referenced by the scene files are also referenced by the spec file.


