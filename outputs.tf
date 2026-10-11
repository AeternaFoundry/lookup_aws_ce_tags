output "ce_tags_lookup_id" {
  description = "Map of id values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ce_tags_lookup_filter" {
  description = "Map of filter values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => one(v.filter) if v.filter != null && length(v.filter) > 0 }
}
output "ce_tags_lookup_search_string" {
  description = "Map of search_string values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => v.search_string if v.search_string != null && length(v.search_string) > 0 }
}
output "ce_tags_lookup_sort_by" {
  description = "Map of sort_by values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => v.sort_by if v.sort_by != null && length(v.sort_by) > 0 }
}
output "ce_tags_lookup_tag_key" {
  description = "Map of tag_key values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => v.tag_key if v.tag_key != null && length(v.tag_key) > 0 }
}
output "ce_tags_lookup_tags" {
  description = "Map of tags values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "ce_tags_lookup_time_period" {
  description = "Map of time_period values across all ce_tags_lookup, keyed the same as var.ce_tags_lookup"
  value       = { for k, v in data.aws_ce_tags.ce_tags_lookup : k => one(v.time_period) if v.time_period != null && length(v.time_period) > 0 }
}

