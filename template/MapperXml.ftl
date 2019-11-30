<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package_name}.mapper.${table_name?cap_first}Mapper">

    <!-- 根据条件查询 -->
    <select id="query" resultType="${package_name}.dto.${table_name?cap_first}Dto">
        select * from T_${table_name}
        <where>
            <if test="query != null and query != ''">
                <#if field?exists>
                and ( <#list 0..(field!?size-1) as i><#if field[i].name != 'id'>${field[i].name?uncap_first} like '%${r'${query}'}%'<#if i!= field!?size-1> or </#if></#if></#list> )
                </#if>
            </if>
        </where>
    </select>

</mapper>