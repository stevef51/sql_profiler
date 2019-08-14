#/bin/bash
docker run --rm -it --network=virtualmgr.vmnet sql-profiler --server=mssql --username=sa --password=Andromeda25 --db=$1