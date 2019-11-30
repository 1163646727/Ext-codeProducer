package ${package_name}.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;
import org.ssh.boot.businessCommon.entity.BaseItemEntity;

/**
 * className:  ${table_name?cap_first} <BR>
 * description: ${table_annotation} <BR>
 * remark: <BR>
 * author: ${author} <BR>
 * createDate: ${date} <BR>
 */
@Data
@Entity
@Table(name = "T_${table_name}")
public class ${table_name?cap_first} extends BaseItemEntity {
<#if field?exists><#--field:参数集合-->
<#list field as item>

<#--根据字段的类型，创建对应的属性-->
<#if (item.name != 'id')>
    /** ${item.annotation!} ${author}*/
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
</#if>
</#list>
</#if>
}