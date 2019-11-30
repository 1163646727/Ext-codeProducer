package ${package_name}.dto;

import lombok.Data;

/**
 * className: ${table_name?cap_first}Dto <BR>
 * description: ${table_annotation}出参<BR>
 * remark: <BR>
 * author: ${author} <BR>
 * createDate: ${date} <BR>
 */
@Data
public class ${table_name?cap_first}Dto {
<#if field?exists><#--field:参数集合-->
<#list field as item>

    /** ${item.annotation!} ${author}*/
<#--根据字段的类型，创建对应的属性-->
<#if (item.type = 'varchar' || item.type = 'text')>
    private String ${item.name?uncap_first};
</#if>
<#if item.type = 'timestamp' >
    private Date ${item.name?uncap_first};
</#if>
<#if item.type = 'numeric' >
    private Float ${item.name?uncap_first};
</#if>
<#if item.type = 'bigint' >
    private Long ${item.name?uncap_first};
</#if>
</#list>
</#if>
}
