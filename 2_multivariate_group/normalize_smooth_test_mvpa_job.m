%-----------------------------------------------------------------------
% Job saved on 05-Dec-2023 06:08:53 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%% Dynamically add file paths for all subjects
% Manually create an array of subject labels
subjects = strcat('d', string(1:28)); % Creates an array ["d1", "d2", ..., "d28"]

% Base directory paths
dataBaseDir = '/Volumes/BTCruiser/LGNW/data/';

% Iterate through each subject
for i = 1:length(subjects)
    subjLabel = subjects(i); % Current subject label
    
    % Generate dynamic file paths
    resamplePath = sprintf('%s/%s/stats/mvpa_asl_fs/res_accuracy_minus_chance.nii,1', dataBaseDir, subjLabel);
    defPath = sprintf('%s/%s/orig/processed/y_%s_anat.nii', dataBaseDir, subjLabel, subjLabel);
    
    % Apply the paths to the matlabbatch configuration
    matlabbatch{1}.spm.spatial.normalise.write.subj(i).def = {defPath};
    matlabbatch{1}.spm.spatial.normalise.write.subj(i).resample = {resamplePath};
end
%% Rest of matlab batch script
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';
% Update the number of subjects in the smooth data section
for i = 1:length(subjects)
    matlabbatch{2}.spm.spatial.smooth.data(i) = cfg_dep(sprintf('Normalise: Write: Normalised Images (Subj %d)', i), substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{i}, '.','files'));
end
matlabbatch{2}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{2}.spm.spatial.smooth.dtype = 0;
matlabbatch{2}.spm.spatial.smooth.im = 0;
matlabbatch{2}.spm.spatial.smooth.prefix = 's';
matlabbatch{3}.spm.stats.factorial_design.dir = {'/Volumes/BTCruiser/LGNW/group_results/mvpa'};
matlabbatch{3}.spm.stats.factorial_design.des.t1.scans(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{3}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{3}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{3}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{3}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{3}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{3}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{3}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{4}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{4}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{4}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{5}.spm.stats.review.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{5}.spm.stats.review.display.matrix = 1;
matlabbatch{5}.spm.stats.review.print = 'pdf';
