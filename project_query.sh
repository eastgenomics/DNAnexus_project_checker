projects_004=$(dx find projects --name "004_*" --brief)
for project in $projects_004;
do echo $project;
dx describe $project | grep "Name";
dx describe $project | grep "Created  ";
dx describe $project | grep "Last modified";
dx describe $project | grep "Storage cost";
done > 004_metadata.tsv


###########  004
projects_004=$(dx find projects --name "004_*" --brief)
for project in $projects_004;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Created  ";
done > 004_created_metadata.tsv

for project in $projects_004;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Last modified  ";
done > 004_lastmodified_metadata.tsv

for project in $projects_004;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Storage cost";
done > 004_storagecost_metadata.tsv

############   003

projects_003=$(dx find projects --name "003_*" --brief)
for project in $projects_003;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Created  ";
done > 003_created_metadata.tsv

for project in $projects_003;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Last modified  ";
done > 003_lastmodified_metadata.tsv

for project in $projects_003;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Storage cost";
done > 003_storagecost_metadata.tsv


############   002

projects_002=$(dx find projects --name "002_*" --brief)
for project in $projects_002;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Created  ";
done > 002_created_metadata.tsv

for project in $projects_002;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Last modified  ";
done > 002_lastmodified_metadata.tsv

for project in $projects_002;
do dx describe $project | grep "Name" | awk -F " " '{print $2}';
dx describe $project | grep "Storage cost";
done > 002_storagecost_metadata.tsv