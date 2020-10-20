-add-to-spec-file                        ADD A FILE TO A SPECIFICATION FILE
-backend-average-dense-roi               CONNECTOME DB BACKEND COMMAND FOR CIFTI AVERAGE DENSE ROI
-backend-average-roi-correlation         CONNECTOME DB BACKEND COMMAND FOR CIFTI AVERAGE ROI CORRELATION
-border-export-color-table               WRITE BORDER NAMES AND COLORS AS TEXT
-border-file-export-to-caret5            EXPORT BORDER FILE TO CARET5 FILE FORMAT
-border-length                           REPORT LENGTH OF BORDERS
-border-merge                            MERGE BORDER FILES INTO A NEW FILE
-border-resample                         RESAMPLE A BORDER FILE TO A DIFFERENT MESH
-border-to-rois                          MAKE METRIC ROIS FROM BORDERS
-border-to-vertices                      DRAW BORDERS AS VERTICES IN A METRIC FILE
-cifti-all-labels-to-rois                MAKE ROIS FROM ALL LABELS IN A CIFTI LABEL MAP
-cifti-average                           AVERAGE CIFTI FILES
-cifti-average-dense-roi                 AVERAGE CIFTI ROWS ACROSS SUBJECTS BY ROI
-cifti-average-roi-correlation           CORRELATE ROI AVERAGE WITH ALL ROWS THEN AVERAGE ACROSS SUBJECTS
-cifti-change-mapping                    CONVERT TO SCALAR, COPY MAPPING, ETC
-cifti-convert                           DUMP CIFTI MATRIX INTO OTHER FORMATS
-cifti-correlation                       GENERATE CORRELATION OF ROWS IN A CIFTI FILE
-cifti-correlation-gradient              CORRELATE CIFTI ROWS AND TAKE GRADIENT
-cifti-create-dense-from-template        CREATE CIFTI WITH MATCHING DENSE MAP
-cifti-create-dense-scalar               CREATE A CIFTI DENSE SCALAR FILE
-cifti-create-dense-timeseries           CREATE A CIFTI DENSE TIMESERIES
-cifti-create-label                      CREATE A CIFTI LABEL FILE
-cifti-create-parcellated-from-template  MATCH PARCELS TO TEMPLATE BY NAME
-cifti-create-scalar-series              IMPORT SERIES DATA INTO CIFTI
-cifti-cross-correlation                 CORRELATE A CIFTI FILE WITH ANOTHER CIFTI FILE
-cifti-dilate                            DILATE A CIFTI FILE
-cifti-erode                             ERODE A CIFTI FILE
-cifti-estimate-fwhm                     ESTIMATE FWHM SMOOTHNESS OF A CIFTI FILE
-cifti-export-dense-mapping              WRITE INDEX TO ELEMENT MAPPING AS TEXT
-cifti-extrema                           FIND EXTREMA IN A CIFTI FILE
-cifti-false-correlation                 COMPARE CORRELATION LOCALLY AND ACROSS/THROUGH SULCI/GYRI
-cifti-find-clusters                     FILTER CLUSTERS BY AREA/VOLUME
-cifti-gradient                          TAKE GRADIENT OF A CIFTI FILE
-cifti-label-adjacency                   MAKE ADJACENCY MATRIX OF A CIFTI LABEL FILE
-cifti-label-export-table                EXPORT LABEL TABLE FROM CIFTI AS TEXT
-cifti-label-import                      MAKE A CIFTI LABEL FILE FROM A CIFTI FILE
-cifti-label-probability                 FIND FREQUENCY OF CIFTI LABELS
-cifti-label-to-border                   DRAW BORDERS AROUND CIFTI LABELS
-cifti-label-to-roi                      MAKE A CIFTI LABEL INTO AN ROI
-cifti-math                              EVALUATE EXPRESSION ON CIFTI FILES
-cifti-merge                             MERGE CIFTI TIMESERIES, SCALAR, OR LABEL FILES
-cifti-merge-dense                       MERGE CIFTI FILES ALONG DENSE DIMENSION
-cifti-merge-parcels                     MERGE CIFTI FILES ALONG PARCELS DIMENSION
-cifti-pairwise-correlation              CORRELATE PAIRED ROWS BETWEEN TWO CIFTI FILES
-cifti-palette                           SET PALETTE ON A CIFTI FILE
-cifti-parcel-mapping-to-label           CREATE DLABEL FROM PARCELLATED FILE
-cifti-parcellate                        PARCELLATE A CIFTI FILE
-cifti-reduce                            PERFORM REDUCTION OPERATION ON A CIFTI FILE
-cifti-reorder                           REORDER THE PARCELS OR SCALAR/LABEL MAPS IN A CIFTI FILE
-cifti-replace-structure                 REPLACE DATA IN A STRUCTURE IN A CIFTI FILE
-cifti-resample                          RESAMPLE A CIFTI FILE TO A NEW CIFTI SPACE
-cifti-resample-dconn-memory             USE LOTS OF MEMORY TO RESAMPLE DCONN
-cifti-restrict-dense-map                EXCLUDE BRAINORDINATES FROM A CIFTI FILE
-cifti-roi-average                       AVERAGE ROWS IN A SINGLE CIFTI FILE
-cifti-rois-from-extrema                 CREATE CIFTI ROI MAPS FROM EXTREMA MAPS
-cifti-separate                          WRITE A CIFTI STRUCTURE AS METRIC, LABEL OR VOLUME
-cifti-smoothing                         SMOOTH A CIFTI FILE
-cifti-stats                             STATISTICS ALONG CIFTI COLUMNS
-cifti-transpose                         TRANSPOSE A CIFTI FILE
-cifti-vector-operation                  DO A VECTOR OPERATION ON CIFTI FILES
-cifti-weighted-stats                    WEIGHTED STATISTICS ALONG CIFTI COLUMNS
-class-add-member                        ADD MEMBER AND GETTER/SETTER TO SOURCE CODE FILES (.h and .cxx)
-class-create                            CREATE CLASS SOURCE CODE FILES (.h and .cxx)
-class-create-algorithm                  CREATE SOURCE CODE CLASS FILES (.h, .cxx) FOR ALGORITHM
-class-create-enum                       CREATE SOURCE CODE CLASS FILES (.h, .cxx) FOR ENUMERATED TYPE
-class-create-operation                  CREATE SOURCE CODE CLASS FILES (.h, .cxx) FOR OPERATION
-convert-affine                          CONVERT AN AFFINE FILE BETWEEN CONVENTIONS
-convert-fiber-orientations              CONVERT BINGHAM PARAMETER VOLUMES TO FIBER ORIENTATION FILE
-convert-matrix4-to-matrix2              GENERATES A MATRIX2 CIFTI FROM MATRIX4 WBSPARSE
-convert-matrix4-to-workbench-sparse     CONVERT A 3-FILE MATRIX4 TO A WORKBENCH SPARSE FILE
-convert-warpfield                       CONVERT A WARPFIELD BETWEEN CONVENTIONS
-create-signed-distance-volume           CREATE SIGNED DISTANCE VOLUME FROM SURFACE
-estimate-fiber-binghams                 ESTIMATE FIBER ORIENTATION DISTRIBUTIONS FROM BEDPOSTX SAMPLES
-fiber-dot-products                      COMPUTE DOT PRODUCTS OF FIBER ORIENTATIONS WITH SURFACE NORMALS
-file-convert                            CHANGE VERSION OF FILE FORMAT
-file-information                        LIST INFORMATION ABOUT A FILE'S CONTENT
-foci-get-projection-vertex              GET PROJECTION VERTEX FOR FOCI
-foci-list-coords                        OUTPUT FOCI COORDINATES IN A TEXT FILE
-foci-resample                           PROJECT FOCI TO A DIFFERENT SURFACE
-gifti-all-labels-to-rois                MAKE ROIS FROM ALL LABELS IN A GIFTI COLUMN
-gifti-convert                           CONVERT A GIFTI FILE TO A DIFFERENT ENCODING
-gifti-label-add-prefix                  ADD PREFIX TO ALL LABEL NAMES IN A GIFTI LABEL FILE
-gifti-label-to-roi                      MAKE A GIFTI LABEL INTO AN ROI METRIC
-label-dilate                            DILATE A LABEL FILE
-label-erode                             ERODE A LABEL FILE
-label-export-table                      EXPORT LABEL TABLE FROM GIFTI AS TEXT
-label-mask                              MASK A LABEL FILE
-label-merge                             MERGE LABEL FILES INTO A NEW FILE
-label-modify-keys                       CHANGE KEY VALUES IN A LABEL FILE
-label-probability                       FIND FREQUENCY OF SURFACE LABELS
-label-resample                          RESAMPLE A LABEL FILE TO A DIFFERENT MESH
-label-to-border                         DRAW BORDERS AROUND LABELS
-label-to-volume-mapping                 MAP LABEL FILE TO VOLUME
-metadata-remove-provenance              REMOVE PROVENANCE INFORMATION FROM FILE METADATA
-metadata-string-replace                 REPLACE A STRING IN ALL METADATA OF A FILE
-metric-convert                          CONVERT METRIC FILE TO FAKE NIFTI
-metric-dilate                           DILATE A METRIC FILE
-metric-erode                            ERODE A METRIC FILE
-metric-estimate-fwhm                    ESTIMATE FWHM SMOOTHNESS OF A METRIC FILE
-metric-extrema                          FIND EXTREMA IN A METRIC FILE
-metric-false-correlation                COMPARE CORRELATION LOCALLY AND ACROSS/THROUGH SULCI/GYRI
-metric-fill-holes                       FILL HOLES IN AN ROI METRIC
-metric-find-clusters                    FILTER CLUSTERS BY SURFACE AREA
-metric-gradient                         SURFACE GRADIENT OF A METRIC FILE
-metric-label-import                     IMPORT A GIFTI LABEL FILE FROM A METRIC FILE
-metric-mask                             MASK A METRIC FILE
-metric-math                             EVALUATE EXPRESSION ON METRIC FILES
-metric-merge                            MERGE METRIC FILES INTO A NEW FILE
-metric-palette                          SET THE PALETTE OF A METRIC FILE
-metric-reduce                           PERFORM REDUCTION OPERATION ACROSS METRIC COLUMNS
-metric-regression                       REGRESS METRICS OUT OF A METRIC FILE
-metric-remove-islands                   REMOVE ISLANDS FROM AN ROI METRIC
-metric-resample                         RESAMPLE A METRIC FILE TO A DIFFERENT MESH
-metric-rois-from-extrema                CREATE METRIC ROI MAPS FROM EXTREMA MAPS
-metric-rois-to-border                   DRAW BORDERS AROUND METRIC ROIS
-metric-smoothing                        SMOOTH A METRIC FILE
-metric-stats                            SPATIAL STATISTICS ON A METRIC FILE
-metric-tfce                             DO TFCE ON A METRIC FILE
-metric-to-volume-mapping                MAP METRIC FILE TO VOLUME
-metric-vector-operation                 DO A VECTOR OPERATION ON METRIC FILES
-metric-vector-toward-roi                FIND IF VECTORS POINT TOWARD AN ROI
-metric-weighted-stats                   WEIGHTED SPATIAL STATISTICS ON A METRIC FILE
-nifti-information                       DISPLAY INFORMATION ABOUT A NIFTI/CIFTI FILE
-probtrackx-dot-convert                  CONVERT A .DOT FILE FROM PROBTRACKX TO CIFTI
-scene-file-merge                        REARRANGE SCENES INTO A NEW FILE
-scene-file-relocate                     RECREATE SCENE FILE IN NEW LOCATION
-set-map-names                           SET THE NAME OF ONE OR MORE MAPS IN A FILE
-set-structure                           SET STRUCTURE OF A DATA FILE
-show-scene                              OFFSCREEN RENDERING OF SCENE TO AN IMAGE FILE
-signed-distance-to-surface              COMPUTE SIGNED DISTANCE FROM ONE SURFACE TO ANOTHER
-spec-file-merge                         MERGE TWO SPEC FILES INTO ONE
-spec-file-relocate                      RECREATE SPEC FILE IN NEW LOCATION
-surface-affine-regression               REGRESS THE AFFINE TRANSFORM BETWEEN SURFACES ON THE SAME MESH
-surface-apply-affine                    APPLY AFFINE TRANSFORM TO SURFACE FILE
-surface-apply-warpfield                 APPLY WARPFIELD TO SURFACE FILE
-surface-average                         AVERAGE SURFACE FILES TOGETHER
-surface-closest-vertex                  FIND CLOSEST SURFACE VERTEX TO COORDINATES
-surface-coordinates-to-metric           MAKE METRIC FILE OF SURFACE COORDINATES
-surface-cortex-layer                    CREATE SURFACE APPROXIMATING A CORTICAL LAYER
-surface-create-sphere                   GENERATE A SPHERE WITH CONSISTENT VERTEX AREAS
-surface-curvature                       CALCULATE CURVATURE OF SURFACE
-surface-cut-resample                    RESAMPLE A CUT SURFACE
-surface-distortion                      MEASURE DISTORTION BETWEEN SURFACES
-surface-flip-lr                         MIRROR A SURFACE THROUGH THE YZ PLANE
-surface-flip-normals                    FLIP ALL TILES ON A SURFACE
-surface-generate-inflated               SURFACE GENERATE INFLATED
-surface-geodesic-distance               COMPUTE GEODESIC DISTANCE FROM ONE VERTEX TO THE ENTIRE SURFACE
-surface-geodesic-distance-all-to-all    COMPUTE GEODESIC DISTANCES FROM ALL VERTICES
-surface-geodesic-rois                   DRAW GEODESIC LIMITED ROIS AT VERTICES
-surface-inflation                       SURFACE INFLATION
-surface-information                     DISPLAY INFORMATION ABOUT A SURFACE
-surface-match                           SURFACE MATCH
-surface-modify-sphere                   CHANGE RADIUS AND OPTIONALLY RECENTER A SPHERE
-surface-normals                         OUTPUT VERTEX NORMALS AS METRIC FILE
-surface-resample                        RESAMPLE A SURFACE TO A DIFFERENT MESH
-surface-set-coordinates                 MODIFY COORDINATES OF A SURFACE
-surface-smoothing                       SURFACE SMOOTHING
-surface-sphere-project-unproject        DEFORM A SPHERE ACCORDING TO A REGISTRATION
-surface-to-surface-3d-distance          COMPUTE DISTANCE BETWEEN CORRESPONDING VERTICES
-surface-vertex-areas                    MEASURE SURFACE AREA EACH VERTEX IS RESPONSIBLE FOR
-surface-wedge-volume                    MEASURE PER-VERTEX VOLUME BETWEEN SURFACES
-unit-test                               UNIT TESTING
-volume-affine-resample                  RESAMPLE VOLUME USING AFFINE TRANSFORM
-volume-all-labels-to-rois               MAKE ROIS FROM ALL LABELS IN A VOLUME FRAME
-volume-capture-plane                    INTERPOLATE IMAGE FROM PLANE THROUGH VOLUME
-volume-copy-extensions                  COPY EXTENDED DATA TO ANOTHER VOLUME FILE
-volume-create                           CREATE A BLANK VOLUME FILE
-volume-dilate                           DILATE A VOLUME FILE
-volume-distortion                       CALCULATE VOLUME WARPFIELD DISTORTION
-volume-erode                            ERODE A VOLUME FILE
-volume-estimate-fwhm                    ESTIMATE FWHM SMOOTHNESS OF A VOLUME
-volume-extrema                          FIND EXTREMA IN A VOLUME FILE
-volume-fill-holes                       FILL HOLES IN AN ROI VOLUME
-volume-find-clusters                    FILTER CLUSTERS BY VOLUME
-volume-gradient                         GRADIENT OF A VOLUME FILE
-volume-label-export-table               EXPORT LABEL TABLE FROM VOLUME AS TEXT
-volume-label-import                     IMPORT A LABEL VOLUME TO WORKBENCH FORMAT
-volume-label-probability                FIND FREQUENCY OF VOLUME LABELS
-volume-label-to-roi                     MAKE A VOLUME LABEL INTO AN ROI VOLUME
-volume-label-to-surface-mapping         MAP A LABEL VOLUME TO A SURFACE LABEL FILE
-volume-math                             EVALUATE EXPRESSION ON VOLUME FILES
-volume-merge                            MERGE VOLUME FILES INTO A NEW FILE
-volume-palette                          SET THE PALETTE OF A VOLUME FILE
-volume-parcel-resampling                SMOOTH AND RESAMPLE VOLUME PARCELS
-volume-parcel-resampling-generic        SMOOTH AND RESAMPLE VOLUME PARCELS FROM DIFFERENT VOLUME SPACE
-volume-parcel-smoothing                 SMOOTH PARCELS IN A VOLUME SEPARATELY
-volume-reduce                           PERFORM REDUCTION OPERATION ACROSS SUBVOLUMES
-volume-remove-islands                   REMOVE ISLANDS FROM AN ROI VOLUME
-volume-reorient                         CHANGE VOXEL ORDER OF A VOLUME FILE
-volume-rois-from-extrema                CREATE VOLUME ROI MAPS FROM EXTREMA MAPS
-volume-set-space                        CHANGE VOLUME SPACE INFORMATION
-volume-smoothing                        SMOOTH A VOLUME FILE
-volume-stats                            SPATIAL STATISTICS ON A VOLUME FILE
-volume-tfce                             DO TFCE ON A VOLUME FILE
-volume-to-surface-mapping               MAP VOLUME TO SURFACE
-volume-vector-operation                 DO A VECTOR OPERATION ON VOLUME FILES
-volume-warpfield-affine-regression      REGRESS AFFINE FROM WARPFIELD
-volume-warpfield-resample               RESAMPLE VOLUME USING WARPFIELD
-volume-weighted-stats                   WEIGHTED SPATIAL STATISTICS ON A VOLUME FILE
-wbsparse-merge-dense                    MERGE WBSPARSE FILES ALONG DENSE DIMENSION
-zip-scene-file                          ZIP A SCENE FILE AND ITS DATA FILES
-zip-spec-file                           ZIP A SPEC FILE AND ITS DATA FILES