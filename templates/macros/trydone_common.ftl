<#macro listParentCateogrys categories category_id content>
	<#local len = categories.size() - 1>
    <#list 0 .. len as i>
        <#assign cate = categories.get(i)>
         <#if (cate.id==category_id)>
             <#local cc="&raquo;<a class=cattitle href="+ JForumContext.encodeURL("/forums/categories/"+cate.id)+">"+cate.name+"</a>"+content />
              <@listParentCateogrys categories,cate.parentId, cc/>
             <#return/>
         </#if>
   </#list>
${content}
</#macro>
