% Calls second-level simple univariate analyses for listed contrasts

% Main script that calls the job script for each contrast
contrasts = {'01', '02', '03', '04', '05', '06', '07'}; % List of contrast (char, not string!)
contrastnames = ...
    {'ASL_sent-base', 'ASL_pseudo-base', 'ASL_sent-pseudo', ...
    'FS_word-pseudo', 'FS_word-cons', 'FS_pseudo-cons', ...
    'ENG_sent-pseudo'};

for i = 1:length(contrasts)
    contrast = contrasts{i}; % Get the current contrast
    contrastname = contrastnames{i}; % Get the current contrast name
    group_univariate_contrast_job(contrast, contrastname); % Call the job script
end
