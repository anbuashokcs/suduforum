
<#-- ******************************************** -->
<#-- Create a <select> HTML field with the category -->
<#-- ******************************************** -->

<#macro selectFieldCategorys  name categories category_id category_parent_id>
    <select name="${name}">
        <option value="0"> ${I18n.getMessage("topLevelCategory")} </option>

	<#local len = categories.size() - 1>
    <#list 0 .. len as i>
		<#local cate = categories.get(i)>
         <#if (cate.parentId==0)>
          <option <#if  category_id==cate.id > value="0" <#else> value="${cate.id}" </#if> <#if category_parent_id==cate.id >  selected="selected" </#if> >&#9500;${cate.name}</option>
             <@listChildNodes categories,cate.id,category_id,category_parent_id,1/>
       </#if>
   </#list>
     </select>
</#macro>

<#macro listChildNodes categories parent_id category_id category_parent_id ni>
	<#local len = categories.size() - 1>
    <#local n=ni+1>              
    <#list 0 .. len as i>
		<#local cate = categories.get(i)>
         <#if (cate.parentId==parent_id)>
          <option <#if  category_id==cate.id > value="0" <#else> value="${cate.id}" </#if> <#if category_parent_id==cate.id >  selected="selected" </#if> ><#list 0..(n-1) as k>&#9474;</#list>&#9500;${cate.name}</option>
                <@listChildNodes categories,cate.id,category_id,category_parent_id,n/>
       </#if>
   </#list>
</#macro>