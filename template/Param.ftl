package ${package_name}.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
* className: ${table_name}Param <BR>
* description: ${table_annotation} <BR>
* remark: <BR>
* author: ${author} <BR>
* createDate: ${date} <BR>
*/
@Data
public class ${table_name}Param {
<#if model_column?exists><!--model_column:参数集合-->
    <#list model_column as model>
        /** ${model.columnComment!} ${author}*/
        @ApiModelProperty(value = "${model.columnComment!}")
        <!--根据字段的类型，创建对应的属性-->
        <#if (model.columnType = 'varchar' || model.columnType = 'text')>
            private String ${model.changeColumnName?uncap_first};
        </#if>

        <#if model.columnType = 'timestamp' >
            private Date ${model.changeColumnName?uncap_first};
        </#if>

        <#if model.columnType = 'numeric' >
            private Float ${model.changeColumnName?uncap_first};
        </#if>

        <#if model.columnType = 'bigint' >
            private Long ${model.changeColumnName?uncap_first};
        </#if>
    </#list>
</#if>
}