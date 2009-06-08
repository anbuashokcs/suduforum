//<#assign show_topics = show_topics?default(false)/>
//<#assign show_posts = show_posts?default(false)/>
//for trydone.com by pinke 20071017
//http://localhost:8080/jforum.page?module=ajax&action=getTopicByForumId&forumId=1
//<#if show_topics>
var trydone_topics = [
{}//<#list topics as topic>
        ,{ id:"${topic.id}"
    ,forumId:"${topic.forumId}"
    ,totalViews:"${topic.totalViews}"
    ,totalReplies:"${topic.totalReplies}"
    ,status:"${topic.status}"
    ,type:"${topic.type}"
    ,firstPostId:"${topic.firstPostId}"
    ,lastPostId:"${topic.lastPostId}"
    ,voteId:"${topic.voteId}"
    ,movedId:"${topic.movedId}"
    ,isRead :"<#if topic.read>true<#else>false</#if>"
    ,isModerated:"<#if topic.moderated>true<#else>false</#if>"
    ,isHot:"<#if topic.hot>true<#else>false</#if>"
    ,hasAttach:"<#if  topic.hasAttach()>true<#else>false</#if>"
    ,paginate:"<#if  topic.paginate>true<#else>false</#if>"
    ,title:"${topic.getTitle().replaceAll("\\u005c","\\\\u005c\\\\u005c").replaceAll("\"","\\\\\"").replaceAll("\n","\\\\\n").replaceAll("\r","\\\\r")}"
    ,postedBy:{id:"${topic.postedBy.id}",username:"${topic.postedBy.username}"}
    ,lastPostBy:{id:"${topic.lastPostBy.id}",username:"${topic.lastPostBy.username}"}
    ,firstPostTime:"${topic.firstPostTime}"
    ,lastPostTime:"${topic.lastPostTime}"
}
//</#list>
        ];
if (callbackAm) {
    callbackAm(trydone_topics);
};
//</#if>
//<#if show_posts>
var trydone_posts = [
{}//<#list posts as pm>
,{id:"${pm.id}"
    ,topicId:"${pm.topicId}"
    ,forumId:"${pm.forumId}"
    ,userId:"${pm.userId}"
    ,subject:"${pm.getSubject().replaceAll("\\u005c","\\\\u005c\\\\u005c").replaceAll("\"","\\\\\"").replaceAll("\n","\\\\\n").replaceAll("\r","\\\\r")}"
    ,text:"${pm.getText().replaceAll("\\u005c","\\\\u005c\\\\u005c").replaceAll("\"","\\\\\"").replaceAll("\n","\\\\\n").replaceAll("\r","\\\\r")}"
    ,postUsername:"${pm.postUsername}"
    ,bbCodeEnabled:"<#if pm.bbCodeEnabled>true<#else>false</#if>"
    ,htmlEnabled:"<#if pm.htmlEnabled>true<#else>false</#if>"
    ,smiliesEnabled:"<#if pm.smiliesEnabled>true<#else>false</#if>"
    ,signatureEnabled:"<#if pm.signatureEnabled>true<#else>false</#if>"
    ,editCount:"${pm.editCount}"
    ,userIp:"${pm.userIp}"
    ,canEdit:"<#if pm.canEdit>true<#else>false</#if>"
    ,hasAttachments:"<#if pm.hasAttachments()>true<#else>false</#if>"
    ,moderate:"<#if pm.moderate>true<#else>false</#if>"
}
//</#list>
        ]   ;
if (callbackAm) {
    callbackAm(trydone_posts);
};
//</#if>