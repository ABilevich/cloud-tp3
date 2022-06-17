# ---------------------------------------------------------------------------
# Amazon WAF resources
# ---------------------------------------------------------------------------

module "waf" {
    source   = "../../modules/waf"

    providers = {
        aws = aws.aws
    }

    web_acl_name            = local.waf.web_acl_name
    web_acl_metics          = local.waf.web_acl_metics
    waf_rule_name           = local.waf.waf_rule_name
    waf_rule_metrics        = local.waf.waf_rule_metrics
    waf_rule_group_name     = local.waf.waf_rule_group_name
    waf_rule_group_metrics  = local.waf.waf_rule_group_metrics
}