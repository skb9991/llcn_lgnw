% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'/Users/bterhunecotter/My Drive/SDSU_LLCN/LGNW/2_Scripts/1_multivariate/specify_estimate_model_o2_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
