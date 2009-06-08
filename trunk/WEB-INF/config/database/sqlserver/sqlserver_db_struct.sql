��IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_vote_results]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_vote_results]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_config]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_config]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_vote_voters]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_vote_voters]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_forums]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_words]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_words]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_karma]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_karma]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_bookmarks]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_bookmarks]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums_watch]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_forums_watch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_quota_limit]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_quota_limit]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_groups]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_groups]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_extension_groups]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_extension_groups]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_posts]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_extensions]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_extensions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_attach]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach_desc]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_attach_desc]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach_quota]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_attach_quota]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts_text]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_posts_text]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_users]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_privmsgs]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_privmsgs]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_privmsgs_text]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_privmsgs_text]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_ranks]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_ranks]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_role_values]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_role_values]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_roles]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_results]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_search_results]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_banlist]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_banlist]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_search_topics]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_wordmatch]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_search_wordmatch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_words]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_search_words]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_sessions]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_sessions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_smilies]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_smilies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_themes]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_themes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_topics]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics_watch]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_topics_watch]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_user_groups]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_user_groups]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_vote_desc]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_vote_desc]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_categories]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_categories]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_moderation_log]') AND type in (N'U'))
DROP TABLE [dbo].[jforum_moderation_log]

-------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_vote_results]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_vote_results](
	[vote_id] [bigint] NOT NULL DEFAULT ((0)),
	[vote_option_id] [tinyint] NOT NULL DEFAULT ((0)),
	[vote_option_text] [varchar](255) NOT NULL,
	[vote_result] [bigint] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_config]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_config](
	[config_name] [varchar](255) NOT NULL,
	[config_value] [varchar](255) NOT NULL,
	[config_id] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[config_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_vote_voters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_vote_voters](
	[vote_id] [bigint] NOT NULL DEFAULT ((0)),
	[vote_user_id] [bigint] NOT NULL DEFAULT ((0)),
	[vote_user_ip] [char](8) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_forums](
	[forum_id] [int] IDENTITY(1,1) NOT NULL,
	[categories_id] [bigint] NOT NULL DEFAULT ((1)),
	[forum_name] [varchar](150) NOT NULL,
	[forum_desc] [varchar](255) NULL,
	[forum_order] [bigint] NULL DEFAULT ((1)),
	[forum_topics] [bigint] NOT NULL DEFAULT ((0)),
	[forum_last_post_id] [bigint] NOT NULL DEFAULT ((0)),
	[moderated] [int] NULL DEFAULT ((0)),
	PRIMARY KEY CLUSTERED 
	(
		[forum_id] ASC
	) WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums]') AND name = N'categories_id')
CREATE NONCLUSTERED INDEX [categories_id] ON [dbo].[jforum_forums] 
(
	[categories_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_words]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_words](
	[word_id] [bigint] IDENTITY(1,1) NOT NULL,
	[word] [varchar](100) NOT NULL,
	[replacement] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[word_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_karma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_karma](
	[karma_id] [bigint] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[post_user_id] [int] NOT NULL,
	[from_user_id] [int] NOT NULL,
	[points] [int] NOT NULL,
	[rate_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[karma_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_karma]') AND name = N'karma_id')
CREATE NONCLUSTERED INDEX [karma_id] ON [dbo].[jforum_karma] 
(
	[karma_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_bookmarks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_bookmarks](
	[bookmark_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[relation_id] [int] NOT NULL,
	[relation_type] [int] NOT NULL,
	[public_visible] [int] NULL DEFAULT ((1)),
	[title] [varchar](255) NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[bookmark_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_bookmarks]') AND name = N'bookmarks_relation_id')
CREATE NONCLUSTERED INDEX [bookmarks_relation_id] ON [dbo].[jforum_bookmarks] 
(
	[relation_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums_watch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_forums_watch](
	[forum_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[forum_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums_watch]') AND name = N'idx_fw_forum')
CREATE NONCLUSTERED INDEX [idx_fw_forum] ON [dbo].[jforum_forums_watch] 
(
	[forum_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_forums_watch]') AND name = N'idx_fw_user')
CREATE NONCLUSTERED INDEX [idx_fw_user] ON [dbo].[jforum_forums_watch] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_quota_limit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_quota_limit](
	[quota_limit_id] [int] IDENTITY(1,1) NOT NULL,
	[quota_desc] [varchar](50) NOT NULL,
	[quota_limit] [int] NOT NULL,
	[quota_type] [tinyint] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[quota_limit_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_groups](
	[group_id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_name] [varchar](40) NOT NULL,
	[group_description] [varchar](255) NULL,
	[parent_id] [bigint] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_extension_groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_extension_groups](
	[extension_group_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[allow] [tinyint] NULL DEFAULT ((1)),
	[upload_icon] [varchar](100) NULL,
	[download_mode] [tinyint] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[extension_group_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_posts](
	[post_id] [bigint] IDENTITY(1,1) NOT NULL,
	[topic_id] [bigint] NOT NULL DEFAULT ((0)),
	[forum_id] [int] NOT NULL DEFAULT ((0)),
	[user_id] [bigint] NULL,
	[post_time] [datetime] NULL,
	[poster_ip] [varchar](15) NULL,
	[enable_bbcode] [tinyint] NOT NULL DEFAULT ((1)),
	[enable_html] [tinyint] NOT NULL DEFAULT ((1)),
	[enable_smilies] [tinyint] NOT NULL DEFAULT ((1)),
	[enable_sig] [tinyint] NOT NULL DEFAULT ((1)),
	[post_edit_time] [datetime] NULL,
	[post_edit_count] [int] NOT NULL DEFAULT ((0)),
	[status] [tinyint] NULL DEFAULT ((1)),
	[attach] [tinyint] NOT NULL DEFAULT ((0)),
	[need_moderate] [tinyint] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts]') AND name = N'forum_id')
CREATE NONCLUSTERED INDEX [forum_id] ON [dbo].[jforum_posts] 
(
	[forum_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts]') AND name = N'topic_id')
CREATE NONCLUSTERED INDEX [topic_id] ON [dbo].[jforum_posts] 
(
	[topic_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts]') AND name = N'user_id')
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[jforum_posts] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_extensions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_extensions](
	[extension_id] [int] IDENTITY(1,1) NOT NULL,
	[extension_group_id] [int] NOT NULL,
	[description] [varchar](100) NULL,
	[upload_icon] [varchar](100) NULL,
	[extension] [varchar](10) NULL,
	[allow] [tinyint] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[extension_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_attach](
	[attach_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[privmsgs_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[attach_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach]') AND name = N'idx_att_post')
CREATE NONCLUSTERED INDEX [idx_att_post] ON [dbo].[jforum_attach] 
(
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach]') AND name = N'idx_att_priv')
CREATE NONCLUSTERED INDEX [idx_att_priv] ON [dbo].[jforum_attach] 
(
	[privmsgs_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach]') AND name = N'idx_att_user')
CREATE NONCLUSTERED INDEX [idx_att_user] ON [dbo].[jforum_attach] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach_desc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_attach_desc](
	[attach_desc_id] [int] IDENTITY(1,1) NOT NULL,
	[attach_id] [int] NOT NULL,
	[physical_filename] [varchar](255) NOT NULL,
	[real_filename] [varchar](255) NOT NULL,
	[download_count] [int] NULL,
	[description ] [varchar](255) NULL,
	[mimetype] [varchar](50) NULL,
	[filesize] [int] NULL,
	[upload_time] [datetime] NULL,
	[thumb] [tinyint] NULL DEFAULT ((0)),
	[extension_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[attach_desc_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach_desc]') AND name = N'idx_att_d_att')
CREATE NONCLUSTERED INDEX [idx_att_d_att] ON [dbo].[jforum_attach_desc] 
(
	[attach_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach_desc]') AND name = N'idx_att_d_ext')
CREATE NONCLUSTERED INDEX [idx_att_d_ext] ON [dbo].[jforum_attach_desc] 
(
	[extension_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_attach_quota]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_attach_quota](
	[attach_quota_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[quota_limit_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[attach_quota_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_posts_text]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_posts_text](
	[post_id] [bigint] NOT NULL DEFAULT ((0)),
	[post_text] [text] NULL,
	[post_subject] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_active] [tinyint] NULL,
	[username] [varchar](50) NOT NULL,
	[user_password] [varchar](32) NOT NULL,
	[user_session_time] [bigint] NULL CONSTRAINT [DF__jforum_us__user___656C112C]  DEFAULT ((0)),
	[user_session_page] [int] NOT NULL CONSTRAINT [DF__jforum_us__user___66603565]  DEFAULT ((0)),
	[user_lastvisit] [datetime] NULL,
	[user_regdate] [datetime] NULL,
	[user_level] [tinyint] NULL,
	[user_posts] [bigint] NOT NULL CONSTRAINT [DF__jforum_us__user___6754599E]  DEFAULT ((0)),
	[user_timezone] [varchar](5) NOT NULL CONSTRAINT [DF__jforum_us__user___68487DD7]  DEFAULT (''),
	[user_style] [tinyint] NULL,
	[user_lang] [varchar](255) NOT NULL CONSTRAINT [DF__jforum_us__user___693CA210]  DEFAULT (''),
	[user_dateformat] [varchar](20) NOT NULL CONSTRAINT [DF__jforum_us__user___6A30C649]  DEFAULT ('%d/%M/%Y %H:%i'),
	[user_new_privmsg] [int] NOT NULL CONSTRAINT [DF__jforum_us__user___6B24EA82]  DEFAULT ((0)),
	[user_unread_privmsg] [int] NOT NULL CONSTRAINT [DF__jforum_us__user___6C190EBB]  DEFAULT ((0)),
	[user_last_privmsg] [datetime] NULL,
	[user_emailtime] [datetime] NULL,
	[user_viewemail] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___6D0D32F4]  DEFAULT ((0)),
	[user_attachsig] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___6E01572D]  DEFAULT ((1)),
	[user_allowhtml] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___6EF57B66]  DEFAULT ((0)),
	[user_allowbbcode] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___6FE99F9F]  DEFAULT ((1)),
	[user_allowsmilies] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___70DDC3D8]  DEFAULT ((1)),
	[user_allowavatar] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___71D1E811]  DEFAULT ((1)),
	[user_allow_pm] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___72C60C4A]  DEFAULT ((1)),
	[user_allow_viewonline] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___73BA3083]  DEFAULT ((1)),
	[user_notify] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___74AE54BC]  DEFAULT ((1)),
	[user_notify_always] [tinyint] NULL,
	[user_notify_text] [tinyint] NULL,
	[user_notify_pm] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___75A278F5]  DEFAULT ((1)),
	[user_popup_pm] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___76969D2E]  DEFAULT ((1)),
	[rank_id] [int] NULL CONSTRAINT [DF__jforum_us__rank___778AC167]  DEFAULT ((0)),
	[user_avatar] [varchar](100) NULL,
	[user_avatar_type] [tinyint] NOT NULL CONSTRAINT [DF__jforum_us__user___787EE5A0]  DEFAULT ((0)),
	[user_email] [varchar](255) NOT NULL CONSTRAINT [DF__jforum_us__user___797309D9]  DEFAULT (''),
	[user_icq] [varchar](15) NULL,
	[user_website] [varchar](100) NULL,
	[user_from] [varchar](100) NULL,
	[user_sig] [text] NULL,
	[user_sig_bbcode_uid] [varchar](10) NULL,
	[user_aim] [varchar](255) NULL,
	[user_yim] [varchar](255) NULL,
	[user_msnm] [varchar](255) NULL,
	[user_occ] [varchar](100) NULL,
	[user_interests] [varchar](255) NULL,
	[user_biography] [text] NULL,
	[user_actkey] [varchar](32) NULL,
	[gender] [char](1) NULL,
	[themes_id] [bigint] NULL,
	[deleted] [tinyint] NULL,
	[user_viewonline] [tinyint] NULL CONSTRAINT [DF__jforum_us__user___7A672E12]  DEFAULT ((1)),
	[security_hash] [varchar](32) NULL,
	[user_karma] [decimal](10, 2) NULL,
	[user_authhash] [varchar](32) NULL,
    [user_qq] [VARCHAR](15),
    [user_sex] [tinyint] default 0,
    [user_birthday] [datetime] default null
 CONSTRAINT [PK__jforum_users__6477ECF3] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_privmsgs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_privmsgs](
	[privmsgs_id] [bigint] IDENTITY(1,1) NOT NULL,
	[privmsgs_type] [tinyint] NOT NULL DEFAULT ((0)),
	[privmsgs_subject] [varchar](255) NOT NULL,
	[privmsgs_from_userid] [bigint] NOT NULL DEFAULT ((0)),
	[privmsgs_to_userid] [bigint] NOT NULL DEFAULT ((0)),
	[privmsgs_date] [datetime] NULL,
	[privmsgs_ip] [varchar](8) NOT NULL DEFAULT (''),
	[privmsgs_enable_bbcode] [tinyint] NOT NULL DEFAULT ((1)),
	[privmsgs_enable_html] [tinyint] NOT NULL DEFAULT ((0)),
	[privmsgs_enable_smilies] [tinyint] NOT NULL DEFAULT ((1)),
	[privmsgs_attach_sig] [tinyint] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[privmsgs_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_privmsgs_text]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_privmsgs_text](
	[privmsgs_id] [bigint] NOT NULL DEFAULT ((0)),
	[privmsgs_text] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[privmsgs_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_ranks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_ranks](
	[rank_id] [int] IDENTITY(1,1) NOT NULL,
	[rank_title] [varchar](50) NOT NULL,
	[rank_min] [bigint] NOT NULL DEFAULT ((0)),
	[rank_special] [tinyint] NULL,
	[rank_image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[rank_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_role_values]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_role_values](
	[role_id] [bigint] NOT NULL DEFAULT ((0)),
	[role_value] [varchar](255) NULL,
	[role_type] [tinyint] NULL DEFAULT ((1))
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_role_values]') AND name = N'idx_role')
CREATE NONCLUSTERED INDEX [idx_role] ON [dbo].[jforum_role_values] 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_roles](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NULL DEFAULT ((0)),
	[user_id] [bigint] NULL DEFAULT ((0)),
	[name] [varchar](255) NOT NULL,
	[role_type] [tinyint] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_roles]') AND name = N'idx_group')
CREATE NONCLUSTERED INDEX [idx_group] ON [dbo].[jforum_roles] 
(
	[group_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_roles]') AND name = N'idx_name')
CREATE NONCLUSTERED INDEX [idx_name] ON [dbo].[jforum_roles] 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_roles]') AND name = N'idx_user')
CREATE NONCLUSTERED INDEX [idx_user] ON [dbo].[jforum_roles] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_results]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_search_results](
	[topic_id] [bigint] NOT NULL DEFAULT ((0)),
	[session_id] [varchar](150) NULL,
	[search_time] [datetime] NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_results]') AND name = N'idx_sid')
CREATE NONCLUSTERED INDEX [idx_sid] ON [dbo].[jforum_search_results] 
(
	[session_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_results]') AND name = N'topic_id')
CREATE NONCLUSTERED INDEX [topic_id] ON [dbo].[jforum_search_results] 
(
	[topic_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_banlist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_banlist](
	[banlist_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[banlist_ip] [varchar](15) NULL,
	[banlist_email] [varchar](255) NULL,
 CONSTRAINT [PK__jforum_banlist] PRIMARY KEY CLUSTERED 
(
	[banlist_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_banlist]') AND name = N'idx_ip')
CREATE NONCLUSTERED INDEX [idx_ip] ON [dbo].[jforum_banlist] 
(
	[banlist_ip] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_banlist]') AND name = N'idx_user')
CREATE NONCLUSTERED INDEX [idx_user] ON [dbo].[jforum_banlist] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_search_topics](
	[topic_id] [bigint] NOT NULL DEFAULT ((0)),
	[forum_id] [int] NOT NULL DEFAULT ((0)),
	[topic_title] [varchar](60) NOT NULL,
	[user_id] [bigint] NOT NULL DEFAULT ((0)),
	[topic_time] [datetime] NULL,
	[topic_views] [bigint] NULL DEFAULT ((0)),
	[topic_replies] [bigint] NULL DEFAULT ((0)),
	[topic_status] [tinyint] NULL DEFAULT ((0)),
	[topic_vote_id] [tinyint] NULL DEFAULT ((0)),
	[topic_type] [tinyint] NULL DEFAULT ((0)),
	[topic_first_post_id] [bigint] NULL DEFAULT ((0)),
	[topic_last_post_id] [bigint] NOT NULL DEFAULT ((0)),
	[moderated] [int] NULL DEFAULT ((0)),
	[session_id] [varchar](150) NULL,
	[search_time] [datetime] NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND name = N'forum_id')
CREATE NONCLUSTERED INDEX [forum_id] ON [dbo].[jforum_search_topics] 
(
	[forum_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND name = N'topic_first_post_id')
CREATE NONCLUSTERED INDEX [topic_first_post_id] ON [dbo].[jforum_search_topics] 
(
	[topic_first_post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND name = N'topic_id')
CREATE NONCLUSTERED INDEX [topic_id] ON [dbo].[jforum_search_topics] 
(
	[topic_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND name = N'topic_last_post_id')
CREATE NONCLUSTERED INDEX [topic_last_post_id] ON [dbo].[jforum_search_topics] 
(
	[topic_last_post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_topics]') AND name = N'user_id')
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[jforum_search_topics] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_wordmatch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_search_wordmatch](
	[post_id] [bigint] NOT NULL DEFAULT ((0)),
	[word_id] [bigint] NOT NULL DEFAULT ((0)),
	[title_match] [tinyint] NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_wordmatch]') AND name = N'post_id')
CREATE NONCLUSTERED INDEX [post_id] ON [dbo].[jforum_search_wordmatch] 
(
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_wordmatch]') AND name = N'title_match')
CREATE NONCLUSTERED INDEX [title_match] ON [dbo].[jforum_search_wordmatch] 
(
	[title_match] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_wordmatch]') AND name = N'word_id')
CREATE NONCLUSTERED INDEX [word_id] ON [dbo].[jforum_search_wordmatch] 
(
	[word_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_words]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_search_words](
	[word_id] [bigint] IDENTITY(1,1) NOT NULL,
	[word] [varchar](100) NOT NULL,
	[word_hash] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[word_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_words]') AND name = N'word')
CREATE NONCLUSTERED INDEX [word] ON [dbo].[jforum_search_words] 
(
	[word] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_search_words]') AND name = N'word_hash')
CREATE NONCLUSTERED INDEX [word_hash] ON [dbo].[jforum_search_words] 
(
	[word_hash] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_sessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_sessions](
	[session_id] [varchar](150) NULL,
	[session_user_id] [bigint] NOT NULL DEFAULT ((0)),
	[session_start] [datetime] NULL,
	[session_time] [bigint] NULL DEFAULT ((0)),
	[session_ip] [varchar](8) NOT NULL DEFAULT (''),
	[session_page] [bigint] NOT NULL DEFAULT ((0)),
	[session_logged_int] [tinyint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_smilies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_smilies](
	[smilie_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[url] [varchar](100) NULL,
	[disk_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[smilie_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_themes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_themes](
	[themes_id] [bigint] IDENTITY(1,1) NOT NULL,
	[template_name] [varchar](30) NOT NULL,
	[style_name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[themes_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_topics](
	[topic_id] [bigint] IDENTITY(1,1) NOT NULL,
	[forum_id] [int] NOT NULL DEFAULT ((0)),
	[topic_title] [varchar](100) NOT NULL,
	[user_id] [bigint] NOT NULL DEFAULT ((0)),
	[topic_time] [datetime] NULL,
	[topic_views] [bigint] NULL DEFAULT ((1)),
	[topic_replies] [bigint] NULL DEFAULT ((0)),
	[topic_status] [tinyint] NULL DEFAULT ((0)),
	[topic_vote_id] [tinyint] NULL DEFAULT ((0)),
	[topic_type] [tinyint] NULL DEFAULT ((0)),
	[topic_first_post_id] [bigint] NULL DEFAULT ((0)),
	[topic_last_post_id] [bigint] NOT NULL DEFAULT ((0)),
	[moderated] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics]') AND name = N'forum_id')
CREATE NONCLUSTERED INDEX [forum_id] ON [dbo].[jforum_topics] 
(
	[forum_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics]') AND name = N'topic_first_post_id')
CREATE NONCLUSTERED INDEX [topic_first_post_id] ON [dbo].[jforum_topics] 
(
	[topic_first_post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics]') AND name = N'topic_last_post_id')
CREATE NONCLUSTERED INDEX [topic_last_post_id] ON [dbo].[jforum_topics] 
(
	[topic_last_post_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics]') AND name = N'user_id')
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[jforum_topics] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics_watch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_topics_watch](
	[topic_id] [bigint] NOT NULL DEFAULT ((0)),
	[user_id] [bigint] NOT NULL DEFAULT ((0)),
	[is_read] [tinyint] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics_watch]') AND name = N'idx_topic')
CREATE NONCLUSTERED INDEX [idx_topic] ON [dbo].[jforum_topics_watch] 
(
	[topic_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_topics_watch]') AND name = N'idx_user')
CREATE NONCLUSTERED INDEX [idx_user] ON [dbo].[jforum_topics_watch] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_user_groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_user_groups](
	[group_id] [bigint] NOT NULL DEFAULT ((0)),
	[user_id] [bigint] NOT NULL DEFAULT ((0))
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_user_groups]') AND name = N'idx_group')
CREATE NONCLUSTERED INDEX [idx_group] ON [dbo].[jforum_user_groups] 
(
	[group_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[jforum_user_groups]') AND name = N'idx_user')
CREATE NONCLUSTERED INDEX [idx_user] ON [dbo].[jforum_user_groups] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_vote_desc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_vote_desc](
	[vote_id] [bigint] IDENTITY(1,1) NOT NULL,
	[topic_id] [bigint] NOT NULL DEFAULT ((0)),
	[vote_text] [text] NOT NULL,
	[vote_start] [bigint] NOT NULL DEFAULT ((0)),
	[vote_length] [bigint] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[vote_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[jforum_categories](
	[categories_id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[display_order] [bigint] NOT NULL DEFAULT ((0)),
	[moderated] [tinyint] NULL DEFAULT ((0)),
	[parent_id] [bigint] NULL DEFAULT ((0))
PRIMARY KEY CLUSTERED 
(
	[categories_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jforum_moderation_log]') AND type in (N'U'))
BEGIN
CREATE TABLE CREATE TABLE [dbo].[jforum_moderation_log] (
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint]) NOT NULL,
	[log_description] BLOB NOT NULL,
	[log_original_message] BLOB,
	[log_date] DATE NOT NULL,
	[log_type] [tinyint] DEFAULT ((0)),
	[post_id] [bigint],
	[topic_id] [bigint],
	[post_user_Id] [bigint]
	PRIMARY KEY CLUSTERED 
	(
		[log_id] ASC
	) WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
