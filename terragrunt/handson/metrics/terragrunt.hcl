terraform {
  source = "../../../modules/01-metrics//."
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_kind = "test"
  chat_version = "3.10.0"
}