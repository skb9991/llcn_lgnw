%-----------------------------------------------------------------------
% Script created in 2024 by Brennan Terhune-Cotter
% spm SPM - SPM12 (7771)
%-----------------------------------------------------------------------

% Filepaths
path_to_data = '/Users/bterhunecotter/_GRFP_data_local/proc';
path_to_spmdir = '/Users/bterhunecotter/Documents/MATLAB/spm12';

% Initialize SPM and configuration of SPM batch job manager
spm('defaults', 'FMRI');
spm_jobman('initcfg');

% Loop through subjects
subjects = {'01'};

for i = 1:length(subjects)
    subject = subjects{i}; % Get the current subject
    spm_smooth_images(subject, 8); % Call the job script; second argument is FWHM value
end

function spm_smooth_images(subject, fwhmvalue)
    disp(['Processing subject ' subject]);

    % Step 1: Select preprocessed unsmoothed runs (nr_*)
    matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'preprocRuns';
    matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-AmerSL_run-01_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-AmerSL_run-02_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-AmerSL_run-03_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-AmerSL_run-04_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-FS_run-01_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-FS_run-02_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-FS_run-03_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-WrEng_run-01_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         {[path_to_data '/sub-' subject '/func/sub-' subject '_task-WrEng_run-02_space-MNI152NLin2009cAsym_desc-preproc_bold.nii']}
                                                                         }';
    
    % Step 2: Smooth functional images at a specific FWHM. (prefix is specified in the job script)
    matlabbatch{2}.spm.spatial.smooth.data(1) = cfg_dep('Named File Selector: preprocRuns(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
    matlabbatch{2}.spm.spatial.smooth.data(2) = cfg_dep('Named File Selector: preprocRuns(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
    matlabbatch{2}.spm.spatial.smooth.data(3) = cfg_dep('Named File Selector: preprocRuns(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
    matlabbatch{2}.spm.spatial.smooth.data(4) = cfg_dep('Named File Selector: preprocRuns(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
    matlabbatch{2}.spm.spatial.smooth.data(5) = cfg_dep('Named File Selector: preprocRuns(5) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{5}));
    matlabbatch{2}.spm.spatial.smooth.data(6) = cfg_dep('Named File Selector: preprocRuns(6) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{6}));
    matlabbatch{2}.spm.spatial.smooth.data(7) = cfg_dep('Named File Selector: preprocRuns(7) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{7}));
    matlabbatch{2}.spm.spatial.smooth.data(8) = cfg_dep('Named File Selector: preprocRuns(8) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{8}));
    matlabbatch{2}.spm.spatial.smooth.data(9) = cfg_dep('Named File Selector: preprocRuns(9) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{9}));
    matlabbatch{2}.spm.spatial.smooth.fwhm = [fwhmvalue fwhmvalue fwhmvalue];
    matlabbatch{2}.spm.spatial.smooth.dtype = 0;
    matlabbatch{2}.spm.spatial.smooth.im = 0;
    matlabbatch{2}.spm.spatial.smooth.prefix = ['s' num2str(fwhmvalue) '_'];
    
     % Run the job
     spm_jobman('run', matlabbatch);
     clear matlabbatch;
end
