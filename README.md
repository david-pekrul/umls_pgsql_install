# UMLS PostgreSQL Install
These files are for installing the UMLS Metathesarus RRF files into a PostgreSQL database.

## Prerequisits
* UMLS License
* RRF Files generated from Metamorphysis
* `psql` available from command line or terminal
    * https://www.compose.com/articles/postgresql-tips-installing-the-postgresql-client/

## Setup
The RRF files are pipe delimited. One problem with them though is that they do not have their `\` characters escaped. 

- [ ] Add script to escape `\` characters
- regex "(?<!\\)\\(?!\\)" == all `\` without a `\` before or after.

## Running
> ./full_install.bat

TODO:
- [ ] Add Linux `full_install.sh`


