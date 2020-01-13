% Run our subjects through the QC function from enigma
addpath('ENIGMA_Cortical_QC_2.0') % function exists here.
QC_output_directory='/data/jux/BBL/projects/enigmaAnxiety/cortical_output/QC_cortical/';
subList = csvread('/data/jux/BBL/projects/enigmaAnxiety/subjectData/AllAnxTd_bblids_scanids.csv');
subList = array2table(subList,'VariableNames',{'bblid','scanid'});
fs_path = '/data/joy/BBL/studies/pnc/processedData/structural/freesurfer53/';

for x = 1:height(subList)
    thisSubID = num2str(subList.bblid(x));
    thisScanID = num2str(subList.scanid(x));
    scan_dir = dir(sprintf('%s/%s/*x%s',fs_path,thisSubID,thisScanID));
    
    %scan_path = [scan_dir.folder,'/',scan_dir.name]; %this doesn't work on
    %the version of matlab on chead. Use this instead:
    scan_path = [fs_path, thisSubID, '/', scan_dir.name];
    try
        func_make_corticalpngs_ENIGMA_QC(QC_output_directory, thisSubID, [scan_path, '/mri/orig.mgz'], [scan_path, '/mri/aparc+aseg.mgz']);
    end
    display(['Done with subject: ', thisSubID, ': ', num2str(x), ' of ', num2str(height(subList))]);
end