% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'/Users/bterhunecotter/My Drive/SDSU_LLCN/READ/2_Scripts/0_preprocessing/preprocess_r_s_c_s_n_s4_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
