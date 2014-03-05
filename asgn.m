fidLabels = fopen(strcat(pwd,'\GSE2187_series_matrix_txt\labels.txt'), 'r');
C = textscan(fidLabels, '%d%d%d%d', 'Delimiter', ' ');
labelFibrate = C{1};
labelStatin = C{2};
labelAzole = C{3};
labelToxicant = C{4};
labelAzole = double(labelAzole);
labelStatin = double(labelStatin);
labelFibrate = double(labelFibrate);
labelToxicant = double(labelToxicant);
fclose(fidLabels);

fidFilenames = fopen(strcat(pwd,'\GSE2187_series_matrix_txt\files.txt'), 'r');
C = textscan(fidFilenames, '%s');
datafiles = char(C{1});
fclose(fidFilenames);

mu = zeros(8565, size(datafiles,1)/3);
variances = zeros(8565, size(datafiles,1)/3);

for i=1:3:size(datafiles,1),
    fidFile1 = fopen(strcat(pwd,'\GSE2187_family_xml\',datafiles(i,:),'-tbl-1.txt'), 'r');
    C = textscan(fidFile1, '%s%f%f%f', 'Delimiter', '\t');
    val1 = C{4};
    fclose(fidFile1);
    
    fidFile2 = fopen(strcat(pwd,'\GSE2187_family_xml\',datafiles(i+1,:),'-tbl-1.txt'), 'r');
    C = textscan(fidFile2, '%s%f%f%f', 'Delimiter', '\t');
    val2 = C{4};
    fclose(fidFile2);
    
    fidFile3 = fopen(strcat(pwd,'\GSE2187_family_xml\',datafiles(i+2,:),'-tbl-1.txt'), 'r');
    C = textscan(fidFile3, '%s%f%f%f', 'Delimiter', '\t');
    val3 = C{4};
    fclose(fidFile3);
    
    values = [val1 val2 val3];
    mu_int = nanmean(values,2);
    mu_int(isnan(mu_int)) = 0;
    mu(:,ceil(i/3)) = mu_int;
    var_int = nanvar(values,1,2);
    var_int(isnan(var_int)) = 1;
    variances(:,ceil(i/3)) = var_int;       % ((values(:,1)-mu_int).^2+(values(:,2)-mu_int).^2+(values(:,3)-mu_int).^2)/3;
    strcat(num2str(i),',',num2str(sum(isnan(mu_int))),',',num2str(sum(isnan(var_int))))
 end
