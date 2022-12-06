#s3_buckets_names = [
#  "teachers-data-archive",
#  "students-record-archive",
#  "school-data-archive",
#
#]

s3_bucket_names = {
  "key1" : {
    "bucket_name" : "teachers-data-archive",
    "bucket_prefix" : "teachers-data-archive",
    "database_name" : "teachers_data_archive",
    "tags" : {
      "Name" : "teachers-data-archive",
      "Owner" : "John Doe",
      "Environment" : "Production",
      "Department" : "IT",
      "CostCenter" : "1234"
    }
  }
}

athena_database_names = [
  "teachers_data_archive",
  "students_record_archive",
  "school_data_archive",

]