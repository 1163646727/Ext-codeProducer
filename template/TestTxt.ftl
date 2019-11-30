<#if field?exists>
<#list 0..(field!?size-1) as i><#if field[i].name != 'id'>${field[i].name?uncap_first}<#if i!= field!?size-1>;</#if></#if></#list>
</#if>
<#if field?exists>
<#list 0..(field!?size-1) as i><#if field[i].name != 'id'>${i}<#if i!= field!?size-1>;</#if></#if></#list>
</#if>
<#if field?exists>
<#list 0..(field!?size-1) as i><#if field[i].name != 'id'>1${i}<#if i!= field!?size-1>;</#if></#if></#list>
</#if>
1;50;1;//查询条件、分页