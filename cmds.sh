
# Make clusters from input set of network ROIs
wb_command \
-cifti-find-clusters default_mode.network.dscalar.nii \
1 \
20\
1 \
20 \
COLUMN \
test.dscalar.nii \
-left-surface templates/S1200.L.midthickness_MSMAll.32k_fs_LR.surf.gii \
-right-surface templates/S1200.R.midthickness_MSMAll.32k_fs_LR.surf.gii