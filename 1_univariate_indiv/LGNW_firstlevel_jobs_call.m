% Calls first-level analysis scripts for all subjects in the LGNW project
% First-level analysis scripts are called specified_estimate_model_0X_job.m
% Subjects either have Order 1 or Order 2

spm('defaults', 'fmri');
spm_jobman('initcfg');

% Call the job script for each subject with Order 1
o1subjects = ...
    {'d1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', ...
    'd15', 'd16', 'd17', 'd18', 'd19', 'd20', 'd21', ...
    'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7'};

for i = 1:length(o1subjects)
    subject = o1subjects{i}; % Get the current subject
    specify_estimate_model_o1_job(subject); % Call the job script
end

% Call the job script for each subject with Order 2
o2subjects = {... 
    'd8', 'd9', 'd10', 'd11', 'd12', 'd13', 'd14', ...
    'd22', 'd23', 'd24', 'd25', 'd26', 'd27', 'd28', ...
    'h8', 'h9', 'h10', 'h11', 'h12', 'h13', 'h14'};

for i = 1:length(o2subjects)
    subject = o2subjects{i}; % Get the current subject
    specify_estimate_model_o2_job(subject); % Call the job script
end