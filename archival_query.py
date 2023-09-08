import csv
import dxpy
import pandas as pd
projects = []
with open("002_TWE.tsv") as file:
    tsv_file = csv.reader(file, delimiter="\t")
    for line in tsv_file:
        projects.append(line[0])



for p in projects:
    project_name = dxpy.bindings.DXProject(p).describe()['name']
    print(project_name)
    files_in_project = list(dxpy.bindings.search.find_data_objects(project=p))
    files_in_project_df = pd.DataFrame.from_dict(files_in_project)
    file_status = []
    for f in files_in_project_df['id']:
        status = dxpy.describe(f)['archivalState']
        file_status.append(status)
    output = project_name + '_file_status.txt'
    with open(output, 'w') as fp:
        fp.write('\n'.join(file_status))