% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'M:\.matlab\GitHub\tyrosine_tutorials\s02s02_tyrosine_spm12_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
