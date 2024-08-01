%-----------------------------------------------------------------------
% Job saved on 19-Mar-2024 14:32:27 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

% array of subjects (null to test if the last subject is run twice, which
% has been an issue)
subjects = ...
    ["d1" "d2" "d3" "d4" "d5" "d6" "d7" ...
    "d15" "d16" "d17" "d18" "d19" "d20" "d21" ...
    "h1" "h2" "h3" "h4" "h5" "h6" "h7" "NULL"];


for i = 1:numel(subjects)

subject = subjects(i);
subject_cell = {char(subject)}; % convert to cell array of character vectors

disp(subject);

matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 's4war_runs';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/s4war' subject_cell{1} '_print1.nii']}
                                                                     {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/s4war' subject_cell{1} '_print2.nii']}
                                                                     {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/s4war' subject_cell{1} '_fs1.nii']}
                                                                     {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/s4war' subject_cell{1} '_fs2.nii']}
                                                                     }';
matlabbatch{2}.spm.stats.fmri_spec.dir = {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/stats/mvpa_1stlvl']};
matlabbatch{2}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{2}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{2}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{2}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('Named File Selector: rd_runs(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).name = 'sem';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).onset = [72
                                                            190
                                                            240
                                                            392];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).name = 'phon';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).onset = [38
                                                            122
                                                            274
                                                            426];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).name = 'ff';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).onset = [4
                                                            156
                                                            308
                                                            358];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).name = 'semFS';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).onset = [190
                                                            392];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(5).name = 'semASL';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(5).onset = [72
                                                            240];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(5).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(5).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(5).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).multi_reg = {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/rp_' subject_cell{1} '_print1.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('Named File Selector: rd_runs(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).name = 'sem';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).onset = [38
                                                            156
                                                            240
                                                            426];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).name = 'phon';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).onset = [4
                                                            190
                                                            308
                                                            358];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).name = 'ff';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).onset = [72
                                                            122
                                                            274
                                                            392];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).name = 'semFS';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).onset = [38
                                                            240];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(5).name = 'semASL';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(5).onset = [156
                                                            426];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(5).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(5).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(5).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(5).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).multi_reg = {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/rp_' subject_cell{1} '_print2.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('Named File Selector: rd_runs(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).name = 'asl';
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).onset = [30
                                                            166
                                                            212
                                                            348
                                                            484];
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).name = 'fs';
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).onset = [60
                                                            106
                                                            242
                                                            318
                                                            453];
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).name = 'still';
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).onset = [0
                                                            136
                                                            272
                                                            378
                                                            424];
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).multi_reg = {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/rp_' subject_cell{1} '_fs1.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('Named File Selector: rd_runs(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).name = 'asl';
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).onset = [30
                                                            166
                                                            212
                                                            348
                                                            424];
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).name = 'fs';
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).onset = [0
                                                            106
                                                            242
                                                            378
                                                            484];
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).name = 'still';
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).onset = [60
                                                            136
                                                            272
                                                            318
                                                            454];
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).multi_reg = {['/Volumes/neurosign/LGNW/1_Data/' subject_cell{1} '/orig/processed/rp_' subject_cell{1} '_fs2.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{2}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{2}.spm.stats.fmri_spec.volt = 1;
matlabbatch{2}.spm.stats.fmri_spec.global = 'None';
matlabbatch{2}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{2}.spm.stats.fmri_spec.mask = {''};
matlabbatch{2}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{3}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{3}.spm.stats.fmri_est.method.Classical = 1;

% Once matlabbatch is fully configured for the current subject, run it
spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);

% Clear matlabbatch for the next iteration
clear matlabbatch;

end