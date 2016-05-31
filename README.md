# PiTagsExtract
A script to extract multiple tag values into CSV files from OSISoft Pi System


The archive contains 2 batch files:
TagsList.bat - will create tags.list file containing all tags available in PI System
TagsExtract.bat - will create CSV file within 'out' directory for each tag containing timestamp and value. By default it will extract last 200 days of data, if you need another period, change "total_days" variable within TagsExtract.bat file

## How to use
Run TagsList.bat
Remove unneeded tags from tags.list
Set 'total_days' variable in TagsExtract.bat
Run TagsExtract.bat
(These scripts might be useful to be run at night, when large amounts of data are needed to be extracted.)

## Limitations
The script cannot handle ArcMaxCollect setting (limiting the transaction size) for now, I am planning to find out a solution for it in future.

(Under the hood, those script are using piconfig.exe utility in read-only manner - "@mode list").

## License

Copyright 2016 Meir Tseitlin

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

~meir