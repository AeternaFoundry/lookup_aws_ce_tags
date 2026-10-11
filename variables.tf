variable "ce_tags_lookup" {
  description = <<EOT
Map of ce_tags_lookup, attributes below
Required:
    - time_period (block):
        - end (required)
        - start (required)
Optional:
    - search_string
    - tag_key
    - filter (block):
        - and (optional, block):
            - cost_category (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
            - dimension (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
            - tags (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
        - cost_category (optional, block):
            - key (optional)
            - match_options (optional)
            - values (optional)
        - dimension (optional, block):
            - key (optional)
            - match_options (optional)
            - values (optional)
        - not (optional, block):
            - cost_category (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
            - dimension (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
            - tags (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
        - or (optional, block):
            - cost_category (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
            - dimension (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
            - tags (optional, block):
                - key (optional)
                - match_options (optional)
                - values (optional)
        - tags (optional, block):
            - key (optional)
            - match_options (optional)
            - values (optional)
    - sort_by (block):
        - key (optional)
        - sort_order (optional)
EOT

  type = map(object({
    search_string = optional(string)
    tag_key       = optional(string)
    time_period = object({
      end   = string
      start = string
    })
    filter = optional(object({
      and = optional(list(object({
        cost_category = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
        dimension = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
        tags = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
      })))
      cost_category = optional(object({
        key           = optional(string)
        match_options = optional(set(string))
        values        = optional(set(string))
      }))
      dimension = optional(object({
        key           = optional(string)
        match_options = optional(set(string))
        values        = optional(set(string))
      }))
      not = optional(object({
        cost_category = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
        dimension = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
        tags = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
      }))
      or = optional(list(object({
        cost_category = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
        dimension = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
        tags = optional(object({
          key           = optional(string)
          match_options = optional(set(string))
          values        = optional(set(string))
        }))
      })))
      tags = optional(object({
        key           = optional(string)
        match_options = optional(set(string))
        values        = optional(set(string))
      }))
    }))
    sort_by = optional(list(object({
      key        = optional(string)
      sort_order = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ce_tags_lookup : (
        v.search_string == null || (length(v.search_string) >= 1 && length(v.search_string) <= 1024)
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ce_tags_lookup : (
        v.tag_key == null || (length(v.tag_key) >= 1 && length(v.tag_key) <= 1024)
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ce_tags_lookup : (
        length(v.time_period.end) >= 0 && length(v.time_period.end) <= 40
      )
    ])
    error_message = "must be between 0 and 40 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ce_tags_lookup : (
        length(v.time_period.start) >= 0 && length(v.time_period.start) <= 40
      )
    ])
    error_message = "must be between 0 and 40 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

