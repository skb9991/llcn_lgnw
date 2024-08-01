% This script is a single-subject MVPA decoding analysis for nouns vs verbs
% in the LOC dataset. It is based on the decoding tutorial from the
% decoding toolbox.

% Add path of where this toolbox is located (if not already in path)
addpath('/Users/bterhunecotter/Documents/MATLAB/spm12/toolbox/decoding_toolbox')

% Arrays of deaf and hearing subjects
deafsubjects = ["d1" "d2" "d3" "d4" "d5" "d6" "d7" "d8" "d9" "d10" "d11" "d12" "d13" "d14" ...
                "d15" "d16" "d17" "d18" "d19" "d20" "d21" "d22" "d23" "d24" "d25" "d26" "d27" "d28"];

hearingsubjects = ["h1" "h2" "h3" "h4" "h5" "h6" "h7" "h8" "h9" "h10" "h11" "h12" "h13" "h14"];

% Array of subjects included in analysis
subjects = [deafsubjects hearingsubjects];

for i = 1:numel(subjects)

    subject = subjects(i);
    subject_cell = {char(subject)}; % convert to cell array of character vectors

    disp(subject);
    
    %% Set the defaults and define the analysis you want to perform
    % Every decoding analysis needs a cfg structure as input. This structure 
    % contains all information necessary to perform a decoding analysis.
    % (for a list of all possible parameters, see decoding.m and decoding_defaults.m).

    % Clear cfg (otherwise previous parameters may still be present upon re-run)
    clear cfg

    % Set the default parameters
    cfg = decoding_defaults;

    % Enter which analysis method (standard is searchlight)
    cfg.analysis = 'searchlight';

    % Specify where the results should be saved
    cfg.results.dir = sprintf('/Volumes/BTCruiser/LGNW/data/%s/stats/mvpa_asl_fs', subject);

    % Create the folder if it doesn't exist
    if ~exist(cfg.results.dir, 'dir')
        mkdir(cfg.results.dir);
    end

    %% Get the file names, labels and run number of each brain image file to use for decoding.

    % Specify the directory to the SPM.mat and all related beta
    %    images, e.g. 'c:\exp\glm\model_buttonpress'
    beta_loc = sprintf('/Volumes/BTCruiser/LGNW/data/%s/stats/mvpa', subject);
    % Specify the label names that you gave the regressors of interest.
    % (run display_regressor_names(beta_loc) for a list of regressor names)
    labelname1 = 'asl';
    labelname2 = 'fs';
    %labelname3 = 'sem';

    % Specify a mask file for which voxels to use in the analysis. 
    % This would either 1+ ROI masks or a whole brain mask (whole brain used here)
    cfg.files.mask = sprintf('/Volumes/BTCruiser/LGNW/data/%s/stats/mvpa/mask.nii', subject);

    % The following function extracts all beta names and corresponding run
    % numbers from the SPM.mat. The function appends ' bin 1' to ' bin m' to
    % the beta names if multiple regressors have been used for each condition 
    % within a run, e.g. when using time derivatives or an FIR design.
    regressor_names = design_from_spm(beta_loc);

    
    % Now with the names of the labels, we can extract the file names and the 
    % run numbers of each label. The labels will be 1 and -1.
    cfg = decoding_describe_data(cfg,{labelname1 labelname2},[1 -1],regressor_names,beta_loc);
    %
    %% Create design for MVPA decoding analysis

    % This creates the leave-one-run-out cross validation design:
    cfg.design = make_design_cv(cfg);

    % The data is UNBALANCED because there is one less print block than the
    % ASL and FS blocks. Okay for now, but check later!!!!
    %cfg.design.unbalanced_data = 'ok';

    %% Set additional parameters manually (optional)

    % Searchlight-specific parameters
    cfg.searchlight.unit = 'mm'; % comment or set to 'voxels' if you want normal voxels
    cfg.searchlight.radius = 12; % this will yield a searchlight radius of 12 units (here: mm).
    cfg.searchlight.spherical = 0;

    % Other parameters of interest:
    % The verbose level allows you to determine how much output you want to see
    % on the console while the program is running (0: no output, 1: normal 
    % output [default], 2: high output).
    cfg.verbose = 1;

    % Choose the method you want to perform (classification or regression). If
    %   the classifier supports the kernel method (currently only libsvm),
    %   then we can also choose classification_kernel (the default).
    cfg.decoding.method = 'classification_kernel'; % this is the default

    % Define which measures/transformations you like to get as ouput
    % For a full list, see "help decoding_transform_results", the transres_*
    % functions in transform_results
    cfg.results.output = {'accuracy_minus_chance', 'confusion_matrix'};
    cfg.results.overwrite = 1;

    %% Optional: Decide what to plot

    % Draw the searchlight every 500th iteration (3d plotting is very slow)
    cfg.plot_selected_voxels = 500;

    % Draw the design
    cfg.plot_design = 0; % this will call display_design(cfg);
    % Display the design in a text format in the Matlab command window
    %display_design(cfg);

    %% Run the decoding analysis
    results = decoding(cfg);
    
end
% This will generate results that are written, some of which are used
% only for sanity checks:
% (a) the decoding results as res_XX.nii, res_XX.img or res_XX.BRIK files
% (b) a res_XX.mat file containing all information in the images and more
% (c) a cfg.mat file containing the settings
% (d) the decoding design as an image in multiple formats
% (e) res_filedetails.txt and res_warnings.mat as sanity checks
%
% If the output contains more than one value per voxel, then (a) is not
% written. If you did a ROI or wholebrain analysis and want to extract the
% exact numerical results, you can do so by loading the result from (b)
% and navigating to the field results.accuracy_minus_chance.output or
% whatever the output is. For searchlight analyses the voxel locations are
% currently only provided as indices.

%% Sixth, inspect the results visually or do statistics

% Visual inspection of searchlight results can be done e.g. using software
% such as MRIcron: Open a background image, select the decoding results
% (typically res_accuracy_minus_chance.img) as overlay and set the range
% between 5 and e.g. 20. Increase the lower value until you can see blobs
% that may look meaningful. These regions may contain information, but may
% not. For statistical analysis at the group-level, normalize and smooth
% the images if not done previously and run a classical second-level
% t-test against 0 (we may change this suggestion in the future)
% 
% ROI or wholebrain analysis:
% Many results are written as images and can be visually inspected using
% MRIcron or similar software. For statistical analysis at the group-level,
% extract all decoding results from the written .mat files and do a t-test
% either with Matlab, SPSS or the software of the choice.
%
% For subject-level statistics, run help decoding_statistics.

%% Some more hints for potentially useful features

% All of these need to be specified BEFORE calling decoding(cfg), of
% course.

% cfg.searchlight.subset = [5, 100, 1000, 1001]'; 
%   only decode some searchlights are executed. This makes sense if you
%   have coordinates and want results at these searchlight ROIs only. It
%   can also be used to parallelize the toolbox, i.e. running the first
%   10000 searchlights on one computer, the second on another, etc. Takes
%   either single values or 3d coordinates.
% (call "help decoding" and search for "subset" for more infos)

