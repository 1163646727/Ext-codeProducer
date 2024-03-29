package ${package_name}.${block}.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
<#if (table_name?substring(table_name?length-4,table_name?length) = 'Dict') >
import org.ssh.boot.businessCommon.utils.StringUtil;
</#if>
import org.ssh.boot.dto.EkPageInfo;
import ${package_name}.${block}.dao.${table_name?cap_first}Dao;
import ${package_name}.${block}.dto.${table_name?cap_first}Dto;
import ${package_name}.${block}.entity.${table_name?cap_first};
import ${package_name}.${block}.mapper.${table_name?cap_first}Mapper;
import ${package_name}.${block}.param.${table_name?cap_first}Param;
import org.ssh.boot.orm.service.BaseService;
import org.ssh.boot.utils.EkBeanUtil;

/**
 * className: ${table_name?cap_first}Service <BR>
 * description: ${table_annotation}业务层<BR>
 * remark: <BR>
 * author: ${author} <BR>
 * createDate: ${date} <BR>
 */
@Service
public class ${table_name?cap_first}Service extends
    BaseService<${table_name?cap_first},Long , ${table_name?cap_first}Dao> {

    @Autowired
    private ${table_name?cap_first}Mapper ${table_name?uncap_first}Mapper;
    @Autowired
    private ${table_name?cap_first}Dao ${table_name?uncap_first}Dao;

    /**
     * methodName: save <BR>
     * description: 新增<BR>
     * remark: <BR>
     * param: itemParam 入参类<BR>
     * return: ${package_name}.${block}.dto.${table_name?cap_first}Dto <BR>
     * author: ${author} <BR>
     * createDate: ${date} <BR>
     */
    public ${table_name?cap_first}Dto save(${table_name?cap_first}Param itemParam){
        ${table_name?cap_first} item = new ${table_name?cap_first}();
        EkBeanUtil.copyPropertiesIgnoreNull(itemParam, item);
        <#if (table_name?substring(table_name?length-4,table_name?length) = 'Dict') ><#--如果是字典Dict结尾-->
        // 处理字典版本号 ChenQi
        if (item.getItemVersion() == null) {
        item.setItemVersion(1L);
        }
        // 生成拼音、五笔码 ChenQi
        String itemName = item.getItemName();
        if (itemName!= null) {
        item.setItemWb(StringUtil.getWb(itemName));
        item.setItemPy(StringUtil.getPy(itemName));
        }
        </#if>
        item = dao.save(item);
        // 封装返回对象 ${author}
        ${table_name?cap_first}Dto itemDto = new ${table_name?cap_first}Dto();
        EkBeanUtil.copyPropertiesIgnoreNull(item, itemDto);
        return itemDto;
    }

    /**
     * methodName: update <BR>
     * description: 修改<BR>
     * remark: <BR>
     * param: item <BR>
     * param: itemParam <BR>
     * return: ${package_name}.${block}.dto.${table_name?cap_first}Dto <BR>
     * author: ${author} <BR>
     * createDate: ${date} <BR>
     */
    public ${table_name?cap_first}Dto update(${table_name?cap_first} item, ${table_name?cap_first}Param itemParam) {
        EkBeanUtil.copyPropertiesIgnoreNull(itemParam, item);
        <#if (table_name?substring(table_name?length-4,table_name?length) = 'Dict') ><#--如果是字典Dict结尾-->
        // 生成拼音、五笔码 ChenQi
        String itemName = item.getItemName();
        if (itemName!= null) {
        item.setItemWb(StringUtil.getWb(itemName));
        item.setItemPy(StringUtil.getPy(itemName));
        }
        </#if>
        item = dao.save(item);
        // 封装返回对象 ${author}
        ${table_name?cap_first}Dto itemDto = new ${table_name?cap_first}Dto();
        EkBeanUtil.copyPropertiesIgnoreNull(item, itemDto);
        return itemDto;
    }

    /**
     * methodName: findById <BR>
     * description: 根据主键查询<BR>
     * remark: <BR>
     * param: id <BR>
     * return: ${package_name}.${block}.dto.${table_name?cap_first}Dto <BR>
     * author: ${author} <BR>
     * createDate: ${date} <BR>
     */
    public ${table_name?cap_first}Dto findById(Long id){
        ${table_name?cap_first} item = dao.findById(id).get();
        // 封装返回对象 ${author}
        ${table_name?cap_first}Dto itemDto = new ${table_name?cap_first}Dto();
        EkBeanUtil.copyPropertiesIgnoreNull(item, itemDto);
        return itemDto;
    }

    /**
     * methodName: queryByIds <BR>
     * description: 根据主键查询 <BR>
     * remark: 用于判断数据是否存在<BR>
     * param: id <BR>
     * return: ${package_name}.${block}.entity.${table_name?cap_first} <BR>
     * author: ${author} <BR>
     * createDate: ${date} <BR>
     */
    public ${table_name?cap_first} queryByIds(Long id){
        return dao.findById(id).get();
    }

    /**
     * methodName: query <BR>
     * description: 根据条件分页查询<BR>
     * remark: <BR>
     * param: ekPageInfo <BR>
     * param: itemParam <BR>
     * return: com.github.pagehelper.PageInfo<${package_name}.${block}.dto.${table_name?cap_first}Dto> <BR>
     * author: ${author} <BR>
     * createDate: ${date} <BR>
     */
    public PageInfo<${table_name?cap_first}Dto> query(EkPageInfo ekPageInfo ,String query){
        // 处理分页 ${author}
        PageHelper.startPage(ekPageInfo.getPageNum(), ekPageInfo.getPageSize());
        // 根据条件查询 ${author}
        // 将模糊查询关键字转大写 ${author}
        List<${table_name?cap_first}Dto> itempDtoList = ${table_name?uncap_first}Mapper.query(<#if (table_name?substring(table_name?length-4,table_name?length) = 'Dict') >query.toUpperCase()<#else >query</#if>);
        PageInfo<${table_name?cap_first}Dto> pageInfo = new PageInfo(itempDtoList);
        return pageInfo;
    }

}
