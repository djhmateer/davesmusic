/****** Object:  Table [dbo].[Playlist]    Script Date: 25/02/2015 16:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumID] [varchar](50) NOT NULL,
	[TrackID] [varchar](50) NULL,
	[TrackName] [nvarchar](255) NULL,
	[AlbumName] [nvarchar](255) NULL,
	[ArtistName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
-- /****** Object:  Table [dbo].[Tracks]    Script Date: 25/02/2015 16:47:04 ******/
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE TABLE [dbo].[Tracks](
	-- [ID] [int] IDENTITY(1,1) NOT NULL,
	-- [TrackID] [nvarchar](50) NOT NULL,
	-- [TrackName] [nvarchar](255) NOT NULL,
	-- [ArtistName] [nvarchar](255) NOT NULL,
 -- CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
-- (
	-- [ID] ASC
-- )WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
-- )

-- GO

/****** Object:  Table [dbo].[Tracks]    Script Date: 26/02/2015 06:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrackID] [nvarchar](50) NOT NULL,
	[TrackName] [nvarchar](255) NOT NULL,
	[ArtistName] [nvarchar](255) NOT NULL,
	[ArtistID] [nvarchar](50) NULL,
	[TrackPreviewURL] [nvarchar](255) NULL,
	[AlbumName] [nvarchar](255) NULL,
	[AlbumID] [nvarchar](50) NULL,
	[AlbumImageURL] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL]) VALUES (3, N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'Muse', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL]) VALUES (4, N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'Muse', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL]) VALUES (8, N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Muse', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO










/****** Object:  Table [dbo].[UserPlaylists]    Script Date: 25/02/2015 16:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPlaylists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](255) NOT NULL,
	[TrackID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_UserPlaylists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
SET IDENTITY_INSERT [dbo].[Playlist] ON 

GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (204, N'3KuXEGcqLcnEYWnn3OEGy0', N'40pPI2TbaYSZlKfV44HRjn', N'Supremacy', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (205, N'3KuXEGcqLcnEYWnn3OEGy0', N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (206, N'3KuXEGcqLcnEYWnn3OEGy0', N'1tjHKKI0r82IB5KL29whHs', N'Panic Station', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (207, N'3KuXEGcqLcnEYWnn3OEGy0', N'3V78QkKzy5bIy0goZj3L8u', N'Prelude', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (208, N'3KuXEGcqLcnEYWnn3OEGy0', N'2IFqUmfW8oQoKn6ToxKsMs', N'Survival', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (209, N'3KuXEGcqLcnEYWnn3OEGy0', N'6r9tjMWLv8fNdZKKTnqCEr', N'Follow Me', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (210, N'3KuXEGcqLcnEYWnn3OEGy0', N'2raJLzvNRvipP8cJuchk6U', N'Animals', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (211, N'3KuXEGcqLcnEYWnn3OEGy0', N'0rlB9MM5FKeRnvJiWOVRYY', N'Explorers', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (212, N'3KuXEGcqLcnEYWnn3OEGy0', N'630CQp2prewTfH1UAvMgCA', N'Big Freeze', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (213, N'3KuXEGcqLcnEYWnn3OEGy0', N'3MbkURW6xUuXYMyZz08qDo', N'Save Me', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (214, N'3KuXEGcqLcnEYWnn3OEGy0', N'4AKRf8MaMfsc1pgpR5e3X9', N'Liquid State', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (215, N'3KuXEGcqLcnEYWnn3OEGy0', N'21lhern14mW8gwK2oOqMbP', N'The 2nd Law: Unsustainable', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (216, N'3KuXEGcqLcnEYWnn3OEGy0', N'4nr4gSTFGmTTSbumSY3kfH', N'The 2nd Law: Isolated System', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (217, N'0eFHYz8NmK75zSplL5qlfM', N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (218, N'0eFHYz8NmK75zSplL5qlfM', N'1C2QJNTmsTxCDBuIgai8QV', N'Resistance', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (219, N'0eFHYz8NmK75zSplL5qlfM', N'0It6VJoMAare1zdV2wxqZq', N'Undisclosed Desires', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (220, N'0eFHYz8NmK75zSplL5qlfM', N'0tHbQRjL5phd8OoYl2Bdnd', N'United States Of Eurasia [+Collateral Damage]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (221, N'0eFHYz8NmK75zSplL5qlfM', N'7jZ5A8bf63qYaUXfuGoxVk', N'Guiding Light', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (222, N'0eFHYz8NmK75zSplL5qlfM', N'28FJMlLUu9NHuwlZWFKDn7', N'Unnatural Selection', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (223, N'0eFHYz8NmK75zSplL5qlfM', N'0MrkZz4D3fGlEkhebjPPrh', N'MK Ultra', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (224, N'0eFHYz8NmK75zSplL5qlfM', N'114rzL6VEy9bb3amPcY3tw', N'I Belong To You [+Mon Coeur S''Ouvre A Ta Voix]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (225, N'0eFHYz8NmK75zSplL5qlfM', N'6zkhhG8iQ8waiwGkQuhoE1', N'Exogenesis: Symphony Part 1 [Overture]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (226, N'0eFHYz8NmK75zSplL5qlfM', N'39kUTBz4uJoy5VtmIybz9D', N'Exogenesis: Symphony Part 2 [Cross-pollination]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (227, N'0eFHYz8NmK75zSplL5qlfM', N'76ZDwA8uTyMys4LIS3pBUX', N'Exogenesis: Symphony Part 3 [Redemption]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (228, N'0lw68yx3MhKflWFqCsGkIs', N'4jrCMOG9OPe6iF4vWFxatb', N'Take a Bow', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (229, N'0lw68yx3MhKflWFqCsGkIs', N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (230, N'0lw68yx3MhKflWFqCsGkIs', N'3lPr8ghNDBLc2uZovNyLs9', N'Supermassive Black Hole', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (231, N'0lw68yx3MhKflWFqCsGkIs', N'5YXr4AGfUQpLSxtFSsKUh6', N'Map Of The Problematique', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (232, N'0lw68yx3MhKflWFqCsGkIs', N'6jH5aCuXgtygWpx7BF54at', N'Soldier''s Poem', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (233, N'0lw68yx3MhKflWFqCsGkIs', N'2zmR3FG7iOGDAdwrVPzdg9', N'Invincible', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (234, N'0lw68yx3MhKflWFqCsGkIs', N'6JnFVmPyJvjnfBag0hhIFa', N'Assassin', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (235, N'0lw68yx3MhKflWFqCsGkIs', N'20vZII9Yu52czI9Fk4p39r', N'Exo-Politics', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (236, N'0lw68yx3MhKflWFqCsGkIs', N'3Sno9FE8r2uz8QP0MtnTPL', N'City Of Delusion', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (237, N'0lw68yx3MhKflWFqCsGkIs', N'0EkE0ripJ9OFNzvZANzo5C', N'Hoodoo', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (238, N'0lw68yx3MhKflWFqCsGkIs', N'7ouMYWpwJ422jRcDASZB7P', N'Knights Of Cydonia', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (239, N'0lw68yx3MhKflWFqCsGkIs', N'6IfitwQQ1Gu9g9QnLWDHRY', N'Glorious', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (240, N'6QU6itggAYKtzjKOMqz8Ch', N'6bv7GJ12vZtPxbJF61GZpF', N'Twice As Hard', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (241, N'6QU6itggAYKtzjKOMqz8Ch', N'3TxkuaIEUv53lEflPskcN8', N'Jealous Again', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (242, N'6QU6itggAYKtzjKOMqz8Ch', N'7Lt3E6laIUeKv5fZSR8cWT', N'Sister Luck', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (243, N'6QU6itggAYKtzjKOMqz8Ch', N'5kIx0L2zoJhqNs5a3DVgE5', N'Could I''ve Been So Blind', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (244, N'6QU6itggAYKtzjKOMqz8Ch', N'5eMnNIvoLg6M8jfu4BavL2', N'Seeing Things', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (245, N'6QU6itggAYKtzjKOMqz8Ch', N'0N7LKqYxUrg5UFb6Z4OSDF', N'Hard To Handle', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (246, N'6QU6itggAYKtzjKOMqz8Ch', N'6CTWaV70GECKdTLp1SLQ8R', N'Thick N'' Thin', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (247, N'6QU6itggAYKtzjKOMqz8Ch', N'37431qrKdYaPF0idZ7o1Zr', N'She Talks To Angels', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (248, N'6QU6itggAYKtzjKOMqz8Ch', N'0jDUVTzofijums7RkuK38H', N'Struttin'' Blues', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (249, N'6QU6itggAYKtzjKOMqz8Ch', N'7xLYiaol8ndOHWQBA6lfMQ', N'Stare It Cold', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (250, N'0HcHPBu9aaF1MxOiZmUQTl', N'51RXhZbTM27y8DUYuQjWG7', N'Intro', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (251, N'0HcHPBu9aaF1MxOiZmUQTl', N'6z0QCh7CTU9bE5C7TAHK4R', N'Apocalypse Please', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (252, N'0HcHPBu9aaF1MxOiZmUQTl', N'2takcwOaAZWiXQijPHIx7B', N'Time Is Running Out', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (253, N'0HcHPBu9aaF1MxOiZmUQTl', N'1hHuyqVCZCbhYQixEkdQCo', N'Sing For Absolution', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (254, N'0HcHPBu9aaF1MxOiZmUQTl', N'5VVWgWH8HFLAtM8lbttvn9', N'Stockholm Syndrome', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (255, N'0HcHPBu9aaF1MxOiZmUQTl', N'5cvFycFL4BTMA3dHSstMqi', N'Falling Away With You', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (256, N'0HcHPBu9aaF1MxOiZmUQTl', N'7gmQ329Ocmvb9OImqevFBF', N'Interlude', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (257, N'0HcHPBu9aaF1MxOiZmUQTl', N'7xyYsOvq5Ec3P4fr6mM9fD', N'Hysteria', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (258, N'0HcHPBu9aaF1MxOiZmUQTl', N'2nTgdpxwpXTk5x1c9yaO3W', N'Blackout', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (259, N'0HcHPBu9aaF1MxOiZmUQTl', N'0xJLcjd0gaZct43xG1UlXS', N'Butterflies and Hurricanes', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (260, N'0HcHPBu9aaF1MxOiZmUQTl', N'6mPJvjjx7pcfZuI57Dh95o', N'The Small Print', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (261, N'0HcHPBu9aaF1MxOiZmUQTl', N'131F3d3InZE2fqzTHptIgQ', N'Endlessly', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (262, N'0HcHPBu9aaF1MxOiZmUQTl', N'7LB6xhGZ0jCbP3PfUDA7yw', N'Thoughts Of A Dying Atheist', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (263, N'0HcHPBu9aaF1MxOiZmUQTl', N'5Zm5oxx8yyLKOAJf1knPmR', N'Ruled By Secrecy', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (264, N'0HcHPBu9aaF1MxOiZmUQTl', N'5Lwp4ZWFVxvCtcpfP22Jvm', N'Fury', N'Absolution', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (277, N'2bPj257oLDCgCyDvPRGSvG', N'1BeyjD03SiBv2jRnOnFudt', N'She''s So Fine', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (278, N'2bPj257oLDCgCyDvPRGSvG', N'4hAx5iTGvFrF7GxyFyLvJR', N'Dirty Love', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (279, N'2bPj257oLDCgCyDvPRGSvG', N'1szPFKgmajejDxP7HpmfZC', N'Don''t Wait For Me', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (280, N'2bPj257oLDCgCyDvPRGSvG', N'4HYCXKwF19WpOAGbRZH8CK', N'Higher Ground', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (281, N'2bPj257oLDCgCyDvPRGSvG', N'1wPEPYiMFQiFiRNlDjJKWy', N'Until My Dying Day', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (282, N'2bPj257oLDCgCyDvPRGSvG', N'7GtdbucESxLrec2lslRLEa', N'Backstreet Symphony', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (283, N'2bPj257oLDCgCyDvPRGSvG', N'71D2G19A2i5BYgTC31p23j', N'Love Walked In', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (284, N'2bPj257oLDCgCyDvPRGSvG', N'2lh7Z3KfNCqxaesF1h8Qjp', N'An Englishman On Holiday', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (285, N'2bPj257oLDCgCyDvPRGSvG', N'2GwYyNbPFk8g6IDc8PQuql', N'Girl''s Going Out Of Her Head', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (286, N'2bPj257oLDCgCyDvPRGSvG', N'4ys2pyHAASWgwSgo93XqJZ', N'Gimme Some Lovin''', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (287, N'2bPj257oLDCgCyDvPRGSvG', N'6oKzGGbFNSIVrfX76tJFE2', N'Distant Thunder', N'Backstreet Symphony', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (288, N'2HOgdtU1aE3zejxmfignwT', N'08kPfhC42ZIlIYoR5DCqRc', N'Come As You Are', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (289, N'2HOgdtU1aE3zejxmfignwT', N'4eF9UcfSClUruJ62Sg7xAU', N'Love Will Tear Us Apart - Album Mix', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (290, N'2HOgdtU1aE3zejxmfignwT', N'79iustc793Bk8OlVHmVUXX', N'Song To The Siren', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (291, N'2HOgdtU1aE3zejxmfignwT', N'6cMx6uYXPWJAHKQEfXxDhJ', N'Whiskey In The Jar', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (292, N'2HOgdtU1aE3zejxmfignwT', N'4aB6dhlQivLelNye0K0ZGC', N'I Heard It Through The Grapevine', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (293, N'2HOgdtU1aE3zejxmfignwT', N'5oiQVDNd7MntRb11LxcwiA', N'Blockbuster', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (294, N'2HOgdtU1aE3zejxmfignwT', N'0zEJDLfaYl787hA51mPRht', N'Sweet Home Alabama', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (295, N'2HOgdtU1aE3zejxmfignwT', N'6oUXfTaKZ0cjGz3cI7fugv', N'Working Class Hero', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (296, N'2HOgdtU1aE3zejxmfignwT', N'7379CJQCAKNFyz07OI6wxm', N'Something Else', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (297, N'2HOgdtU1aE3zejxmfignwT', N'50VwXX4tw5tHBY2LsBICMz', N'All Or Nothing', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (298, N'2HOgdtU1aE3zejxmfignwT', N'4mRsyokdwYqGKpKWax7b12', N'Twentieth Century Boy', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (299, N'2HOgdtU1aE3zejxmfignwT', N'0MepyrmJWvaEdfYl71IGfl', N'Dock Of The Bay', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (300, N'2HOgdtU1aE3zejxmfignwT', N'7bUVlaa3IySAHKFo5JBFux', N'Piece Of My Heart', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (301, N'2HOgdtU1aE3zejxmfignwT', N'1SdQxFW4jyYT8wqqPUixUP', N'No Woman No Cry', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (302, N'2HOgdtU1aE3zejxmfignwT', N'7nfi7xwJtkwkUFogbq6wvU', N'Voodoo Chile', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (303, N'2HOgdtU1aE3zejxmfignwT', N'45b7wxbLgYYbtTeW6CU6dh', N'Whole Lotta Rosie', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (304, N'2HOgdtU1aE3zejxmfignwT', N'6FuMQaHI2cKyv0clkMsbsi', N'New York New York', N'Gravelands', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (305, N'2HOgdtU1aE3zejxmfignwT', N'1mJ92cfkOp4rMmizp1n5Ul', N'That''s Alright Mama', N'Gravelands', NULL)
GO
SET IDENTITY_INSERT [dbo].[Playlist] OFF
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (1, N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'Muse')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (2, N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'Muse')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (3, N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Muse')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (4, N'1hKdDCpiI9mqz1jVHRKG0E', N'Enter Sandman', N'Metallica')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (5, N'3ZFwuJwUpIl0GeXsvF1ELf', N'Nothing Else Matters', N'Metallica')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (6, N'6NwbeybX6TDtXlpXvnUOZC', N'Master Of Puppets', N'Metallica')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (7, N'5ztQHTm1YQqcTkQmgDEU4n', N'Mamma Mia', N'ABBA')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (8, N'5kBZR12AntJUTo9UeAsKqP', N'The Winner Takes It All', N'ABBA')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (9, N'7r5bS08R8d0jZuDZutVeHQ', N'Gimme! Gimme! Gimme! (A Man After Midnight)', N'ABBA')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (10, N'2LlA15ivxoM2Oi3Q4vGtHV', N'Money Money Money', N'Swedish Hitz Goes Metal')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (11, N'3gHIINSk3F9nBowhz8HJuh', N'Mamma Mia', N'Swedish Hitz Goes Metal')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (12, N'61lqNlVRnWYiR9C7BDJw2l', N'You Give Love A Bad Name', N'Bon Jovi')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (13, N'74nl6X5WEfxdRvGkr5weof', N'Wanted Dead Or Alive', N'Bon Jovi')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (14, N'78ApVOpB9Sq8BZWxxURWp2', N'Bed Of Roses', N'Bon Jovi')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (15, N'5NJi5SHoctvtXoxSZ0CWGH', N'Low Life In High Places - 2009 Digital Remaster', N'Thunder')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (16, N'08kPfhC42ZIlIYoR5DCqRc', N'Come As You Are', N'The King')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (17, N'45b7wxbLgYYbtTeW6CU6dh', N'Whole Lotta Rosie', N'The King')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (18, N'2Y2husR6ouTjFLkwZXcjFy', N'I of the Tiger', N'The King')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (19, N'4eF9UcfSClUruJ62Sg7xAU', N'Love Will Tear Us Apart - Album Mix', N'The King')
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName]) VALUES (20, N'5JhEwmvdStxE8F3u0x05nI', N'Sympathy For The Devil', N'The King')
GO
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPlaylists] ON 

GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (1, N'davemateer', N'0c4IEciLCDdXEhhKxj4ThA')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (2, N'davemateer', N'1hKdDCpiI9mqz1jVHRKG0E')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (3, N'davemateer', N'3ZFwuJwUpIl0GeXsvF1ELf')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (4, N'davemateer', N'5kBZR12AntJUTo9UeAsKqP')
GO
SET IDENTITY_INSERT [dbo].[UserPlaylists] OFF
GO
