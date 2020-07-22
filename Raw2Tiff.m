%% read dng, change it to tiff,save tiff files
info_hw =imfinfo('hwP40pro.dng');
info_canon =imfinfo('canon_650d.CR2');

%% handle dng/CR2, convert to tiff
camera='can';%'p40';
if camera=='p40'
    folder_contents=dir('./*.dng');
    for i=1:numel(folder_contents)
        if numel(folder_contents) > 1
            fprintf('Processing %s... (%d/%d)\n', folder_contents(i).name, i, numel(folder_contents));
        end
        file_name=fullfile(folder_contents(i).folder, folder_contents(i).name);
        system(['dcraw -4 -T -D -v ', file_name])% must add space at the last
    end
else
    % handle CR2, to tiff
    folder_contents=dir('./*.CR2');
    for i=1:numel(folder_contents)
        if numel(folder_contents) > 1
            fprintf('Processing %s... (%d/%d)\n', folder_contents(i).name, i, numel(folder_contents));
        end
        file_name=fullfile(folder_contents(i).folder, folder_contents(i).name);
        system(['dcraw -4 -T -D -v ', file_name])% must add space at the last
    end
end
 

