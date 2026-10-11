data "aws_ce_tags" "ce_tags_lookup" {
  for_each = var.ce_tags_lookup

  search_string = each.value.search_string
  tag_key       = each.value.tag_key

  time_period {
    end   = each.value.time_period.end
    start = each.value.time_period.start
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? [each.value.filter] : []
    content {
      dynamic "and" {
        for_each = filter.value.and != null ? filter.value.and : []
        content {
          dynamic "cost_category" {
            for_each = and.value.cost_category != null ? [and.value.cost_category] : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }
          dynamic "dimension" {
            for_each = and.value.dimension != null ? [and.value.dimension] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }
          dynamic "tags" {
            for_each = and.value.tags != null ? [and.value.tags] : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }
      dynamic "cost_category" {
        for_each = filter.value.cost_category != null ? [filter.value.cost_category] : []
        content {
          key           = cost_category.value.key
          match_options = cost_category.value.match_options
          values        = cost_category.value.values
        }
      }
      dynamic "dimension" {
        for_each = filter.value.dimension != null ? [filter.value.dimension] : []
        content {
          key           = dimension.value.key
          match_options = dimension.value.match_options
          values        = dimension.value.values
        }
      }
      dynamic "not" {
        for_each = filter.value.not != null ? [filter.value.not] : []
        content {
          dynamic "cost_category" {
            for_each = not.value.cost_category != null ? [not.value.cost_category] : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }
          dynamic "dimension" {
            for_each = not.value.dimension != null ? [not.value.dimension] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }
          dynamic "tags" {
            for_each = not.value.tags != null ? [not.value.tags] : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }
      dynamic "or" {
        for_each = filter.value.or != null ? filter.value.or : []
        content {
          dynamic "cost_category" {
            for_each = or.value.cost_category != null ? [or.value.cost_category] : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }
          dynamic "dimension" {
            for_each = or.value.dimension != null ? [or.value.dimension] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }
          dynamic "tags" {
            for_each = or.value.tags != null ? [or.value.tags] : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }
      dynamic "tags" {
        for_each = filter.value.tags != null ? [filter.value.tags] : []
        content {
          key           = tags.value.key
          match_options = tags.value.match_options
          values        = tags.value.values
        }
      }
    }
  }

  dynamic "sort_by" {
    for_each = each.value.sort_by != null ? each.value.sort_by : []
    content {
      key        = sort_by.value.key
      sort_order = sort_by.value.sort_order
    }
  }
}

