drop table Playlist
drop table tracks
drop table UserPlaylists
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 27/02/2015 06:58:42 ******/
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
/****** Object:  Table [dbo].[Tracks]    Script Date: 27/02/2015 06:58:42 ******/
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
	[AlbumDate] [datetime] NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[UserPlaylists]    Script Date: 27/02/2015 06:58:42 ******/
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
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (227, N'3KuXEGcqLcnEYWnn3OEGy0', N'40pPI2TbaYSZlKfV44HRjn', N'Supremacy', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (228, N'3KuXEGcqLcnEYWnn3OEGy0', N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (229, N'3KuXEGcqLcnEYWnn3OEGy0', N'1tjHKKI0r82IB5KL29whHs', N'Panic Station', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (230, N'3KuXEGcqLcnEYWnn3OEGy0', N'3V78QkKzy5bIy0goZj3L8u', N'Prelude', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (231, N'3KuXEGcqLcnEYWnn3OEGy0', N'2IFqUmfW8oQoKn6ToxKsMs', N'Survival', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (232, N'3KuXEGcqLcnEYWnn3OEGy0', N'6r9tjMWLv8fNdZKKTnqCEr', N'Follow Me', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (233, N'3KuXEGcqLcnEYWnn3OEGy0', N'2raJLzvNRvipP8cJuchk6U', N'Animals', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (234, N'3KuXEGcqLcnEYWnn3OEGy0', N'0rlB9MM5FKeRnvJiWOVRYY', N'Explorers', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (235, N'3KuXEGcqLcnEYWnn3OEGy0', N'630CQp2prewTfH1UAvMgCA', N'Big Freeze', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (236, N'3KuXEGcqLcnEYWnn3OEGy0', N'3MbkURW6xUuXYMyZz08qDo', N'Save Me', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (237, N'3KuXEGcqLcnEYWnn3OEGy0', N'4AKRf8MaMfsc1pgpR5e3X9', N'Liquid State', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (238, N'3KuXEGcqLcnEYWnn3OEGy0', N'21lhern14mW8gwK2oOqMbP', N'The 2nd Law: Unsustainable', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (239, N'3KuXEGcqLcnEYWnn3OEGy0', N'4nr4gSTFGmTTSbumSY3kfH', N'The 2nd Law: Isolated System', N'The 2nd Law', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (240, N'0eFHYz8NmK75zSplL5qlfM', N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (241, N'0eFHYz8NmK75zSplL5qlfM', N'1C2QJNTmsTxCDBuIgai8QV', N'Resistance', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (242, N'0eFHYz8NmK75zSplL5qlfM', N'0It6VJoMAare1zdV2wxqZq', N'Undisclosed Desires', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (243, N'0eFHYz8NmK75zSplL5qlfM', N'0tHbQRjL5phd8OoYl2Bdnd', N'United States Of Eurasia [+Collateral Damage]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (244, N'0eFHYz8NmK75zSplL5qlfM', N'7jZ5A8bf63qYaUXfuGoxVk', N'Guiding Light', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (245, N'0eFHYz8NmK75zSplL5qlfM', N'28FJMlLUu9NHuwlZWFKDn7', N'Unnatural Selection', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (246, N'0eFHYz8NmK75zSplL5qlfM', N'0MrkZz4D3fGlEkhebjPPrh', N'MK Ultra', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (247, N'0eFHYz8NmK75zSplL5qlfM', N'114rzL6VEy9bb3amPcY3tw', N'I Belong To You [+Mon Coeur S''Ouvre A Ta Voix]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (248, N'0eFHYz8NmK75zSplL5qlfM', N'6zkhhG8iQ8waiwGkQuhoE1', N'Exogenesis: Symphony Part 1 [Overture]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (249, N'0eFHYz8NmK75zSplL5qlfM', N'39kUTBz4uJoy5VtmIybz9D', N'Exogenesis: Symphony Part 2 [Cross-pollination]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (250, N'0eFHYz8NmK75zSplL5qlfM', N'76ZDwA8uTyMys4LIS3pBUX', N'Exogenesis: Symphony Part 3 [Redemption]', N'The Resistance', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (251, N'3wAdN3V06Btox7NjFfBKRC', N'1FNZq0NV4yymW1wEjIi2eY', N'That Was Just Your Life', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (252, N'3wAdN3V06Btox7NjFfBKRC', N'5Z1fNpUSmmRseYFMlJldKo', N'The End Of The Line', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (253, N'3wAdN3V06Btox7NjFfBKRC', N'5IpHNGT95ldM7zqYvvCi04', N'Broken, Beat & Scarred', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (254, N'3wAdN3V06Btox7NjFfBKRC', N'26i37IFvFmC3517jxxZAJP', N'The Day That Never Comes', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (255, N'3wAdN3V06Btox7NjFfBKRC', N'6VpUZlL6wGaVm98gGUs8Qq', N'All Nightmare Long', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (256, N'3wAdN3V06Btox7NjFfBKRC', N'2V6yO7x7gQuaRoPesMZ5hr', N'Cyanide', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (257, N'3wAdN3V06Btox7NjFfBKRC', N'6xcpkEEppRQOqmo5MWflyF', N'The Unforgiven III', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (258, N'3wAdN3V06Btox7NjFfBKRC', N'1gOIcx7HGmOJU1bWOyyGFN', N'The Judas Kiss', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (259, N'3wAdN3V06Btox7NjFfBKRC', N'0DfFc2HY28tnsuw9XIT1JC', N'Suicide & Redemption', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (260, N'3wAdN3V06Btox7NjFfBKRC', N'20hFFeL5QykY9VWeV5RayW', N'My Apocalypse', N'Death Magnetic', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (261, N'4kwN2OnnrwY2ZBcm379Ahn', N'6Yc26elzS6HaXvG0oI3AUi', N'Frantic', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (262, N'4kwN2OnnrwY2ZBcm379Ahn', N'309o3PJag8FugLJTRTZa77', N'St. Anger', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (263, N'4kwN2OnnrwY2ZBcm379Ahn', N'3sDGCyIl3KevvdcYB5x6np', N'Some Kind Of Monster', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (264, N'4kwN2OnnrwY2ZBcm379Ahn', N'3qr1b8xGZEJEHdwNzXFZum', N'Dirty Window', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (265, N'4kwN2OnnrwY2ZBcm379Ahn', N'5z53vQiBCYtpjFeWiZIhmM', N'Invisible Kid', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (266, N'4kwN2OnnrwY2ZBcm379Ahn', N'1eWCFuF6N518k36wZteBEN', N'My World', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (267, N'4kwN2OnnrwY2ZBcm379Ahn', N'26ThPeBphPhlQzzXjzJ7JU', N'Shoot Me Again', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (268, N'4kwN2OnnrwY2ZBcm379Ahn', N'4LGxUtbeH1jOTeGdR636i7', N'Sweet Amber', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (269, N'4kwN2OnnrwY2ZBcm379Ahn', N'4RCJ2xbTfJalOq7RtTsOPv', N'The Unnamed Feeling', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (270, N'4kwN2OnnrwY2ZBcm379Ahn', N'5zmbojPlEp4de0HOrw6Ncv', N'Purify', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (271, N'4kwN2OnnrwY2ZBcm379Ahn', N'7ftmYVN6VQMJ1PgzcHkkfg', N'All Within My Hands', N'St. Anger', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (272, N'7HcHPb1P9mubh0vyDdawAv', N'0mCS6W4eGouKP8WjvcZOJ7', N'The Ecstasy Of Gold (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (273, N'7HcHPb1P9mubh0vyDdawAv', N'2u0m9H0byqN12Ho1Jh1lQh', N'The Call Of Ktulu (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (274, N'7HcHPb1P9mubh0vyDdawAv', N'5zsf8OkgBQoxPPtL11pQCk', N'Master Of Puppets (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (275, N'7HcHPb1P9mubh0vyDdawAv', N'57U9JRGUXtHko5Jc2liyKT', N'Of Wolf And Man (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (276, N'7HcHPb1P9mubh0vyDdawAv', N'22f0HfO1PUGJ3bjVozEewR', N'The Thing That Should Not Be (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (277, N'7HcHPb1P9mubh0vyDdawAv', N'784N3wAWOqGHdODVvnHluw', N'Fuel (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (278, N'7HcHPb1P9mubh0vyDdawAv', N'3Z4zABLK7CRjC6JZdf5Ago', N'The Memory Remains (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (279, N'7HcHPb1P9mubh0vyDdawAv', N'0epHEsqwVe2Viyc02QHdu8', N'No Leaf Clover (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (280, N'7HcHPb1P9mubh0vyDdawAv', N'6CegLoiZXSdPSyexrf8Ju3', N'Hero Of The Day (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (281, N'7HcHPb1P9mubh0vyDdawAv', N'5jcwJsJTlxy2QLFFnjRnxw', N'Devil''s Dance (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (282, N'7HcHPb1P9mubh0vyDdawAv', N'7iUZUlXN9DrDHUX6YKqVTY', N'Bleeding Me (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (283, N'7HcHPb1P9mubh0vyDdawAv', N'6R2MWNoXJ2UKYLDQZrZFy6', N'Nothing Else Matters (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (284, N'7HcHPb1P9mubh0vyDdawAv', N'2Fp00zUfmyiwCXjwcCVPVv', N'Until It Sleeps (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (285, N'7HcHPb1P9mubh0vyDdawAv', N'6eE09AcVjekkR2rWz9GY6C', N'For Whom The Bell Tolls (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (286, N'7HcHPb1P9mubh0vyDdawAv', N'0zDOB6LOKYfgByM7wHor9K', N'- Human (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (287, N'7HcHPb1P9mubh0vyDdawAv', N'0QTz48ypYxaUdPX4qFzz6y', N'Wherever I May Roam (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (288, N'7HcHPb1P9mubh0vyDdawAv', N'2AoUPcthWEu4zcEU6yj6Tt', N'Outlaw Torn (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (289, N'7HcHPb1P9mubh0vyDdawAv', N'4RqI5bDMlDDdBj3dTpJbre', N'Sad But True (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (290, N'7HcHPb1P9mubh0vyDdawAv', N'6C5TFmm7D2YKsKiLJgT03K', N'One (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (291, N'7HcHPb1P9mubh0vyDdawAv', N'5HTpET0Y8mzzaqYQiBDhmx', N'Enter Sandman (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (292, N'7HcHPb1P9mubh0vyDdawAv', N'6oFkYgA97CaQOBOeDwG1DT', N'Battery (Live with the SFSO)', N'S&M', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (293, N'5EsaepzZjkLvl784u0eB9t', N'2ejw3zqMVdhkGbkdFVZVxk', N'Sting Me', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (294, N'5EsaepzZjkLvl784u0eB9t', N'6llJQueoTgqptK1HVUJBSI', N'Remedy', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (295, N'5EsaepzZjkLvl784u0eB9t', N'4dVHnlcE9kQOrzFrjMl2eN', N'Thorn In My Pride', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (296, N'5EsaepzZjkLvl784u0eB9t', N'6dozJ9KMMq6aEdcRQGIIiH', N'Bad Luck Blue Eyes Goodbye', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (297, N'5EsaepzZjkLvl784u0eB9t', N'38EPNznpj4LLwIX4eOtaCu', N'Sometimes Salvation', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (298, N'5EsaepzZjkLvl784u0eB9t', N'6Vo6lNhKAWTvYHUoJgdpCu', N'Hotel Illness', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (299, N'5EsaepzZjkLvl784u0eB9t', N'1gZIvTD05nukEzjgWfBvVi', N'Black Moon Creeping', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (300, N'5EsaepzZjkLvl784u0eB9t', N'2TmuNr4EHiKvErH22snaG2', N'No Speak No Slave', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (301, N'5EsaepzZjkLvl784u0eB9t', N'7I6ZNUPYq4dnKucuwkymuK', N'My Morning Song', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (302, N'5EsaepzZjkLvl784u0eB9t', N'4BXNnTsrIMxxqdqeRtdsA6', N'Time Will Tell', N'The Southern Harmony And Musical Companion', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (303, N'6QU6itggAYKtzjKOMqz8Ch', N'6bv7GJ12vZtPxbJF61GZpF', N'Twice As Hard', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (304, N'6QU6itggAYKtzjKOMqz8Ch', N'3TxkuaIEUv53lEflPskcN8', N'Jealous Again', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (305, N'6QU6itggAYKtzjKOMqz8Ch', N'7Lt3E6laIUeKv5fZSR8cWT', N'Sister Luck', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (306, N'6QU6itggAYKtzjKOMqz8Ch', N'5kIx0L2zoJhqNs5a3DVgE5', N'Could I''ve Been So Blind', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (307, N'6QU6itggAYKtzjKOMqz8Ch', N'5eMnNIvoLg6M8jfu4BavL2', N'Seeing Things', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (308, N'6QU6itggAYKtzjKOMqz8Ch', N'0N7LKqYxUrg5UFb6Z4OSDF', N'Hard To Handle', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (309, N'6QU6itggAYKtzjKOMqz8Ch', N'6CTWaV70GECKdTLp1SLQ8R', N'Thick N'' Thin', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (310, N'6QU6itggAYKtzjKOMqz8Ch', N'37431qrKdYaPF0idZ7o1Zr', N'She Talks To Angels', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (311, N'6QU6itggAYKtzjKOMqz8Ch', N'0jDUVTzofijums7RkuK38H', N'Struttin'' Blues', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (312, N'6QU6itggAYKtzjKOMqz8Ch', N'7xLYiaol8ndOHWQBA6lfMQ', N'Stare It Cold', N'Shake Your Money Maker', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (313, N'0lw68yx3MhKflWFqCsGkIs', N'4jrCMOG9OPe6iF4vWFxatb', N'Take a Bow', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (314, N'0lw68yx3MhKflWFqCsGkIs', N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (315, N'0lw68yx3MhKflWFqCsGkIs', N'3lPr8ghNDBLc2uZovNyLs9', N'Supermassive Black Hole', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (316, N'0lw68yx3MhKflWFqCsGkIs', N'5YXr4AGfUQpLSxtFSsKUh6', N'Map Of The Problematique', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (317, N'0lw68yx3MhKflWFqCsGkIs', N'6jH5aCuXgtygWpx7BF54at', N'Soldier''s Poem', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (318, N'0lw68yx3MhKflWFqCsGkIs', N'2zmR3FG7iOGDAdwrVPzdg9', N'Invincible', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (319, N'0lw68yx3MhKflWFqCsGkIs', N'6JnFVmPyJvjnfBag0hhIFa', N'Assassin', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (320, N'0lw68yx3MhKflWFqCsGkIs', N'20vZII9Yu52czI9Fk4p39r', N'Exo-Politics', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (321, N'0lw68yx3MhKflWFqCsGkIs', N'3Sno9FE8r2uz8QP0MtnTPL', N'City Of Delusion', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (322, N'0lw68yx3MhKflWFqCsGkIs', N'0EkE0ripJ9OFNzvZANzo5C', N'Hoodoo', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (323, N'0lw68yx3MhKflWFqCsGkIs', N'7ouMYWpwJ422jRcDASZB7P', N'Knights Of Cydonia', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (324, N'0lw68yx3MhKflWFqCsGkIs', N'6IfitwQQ1Gu9g9QnLWDHRY', N'Glorious', N'Black Holes And Revelations', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (338, N'00GMnZ71KyvmEnZfqcsFP4', N'2BsqXN1LH76kAqjegAAsTZ', N'Dancing Queen', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (339, N'00GMnZ71KyvmEnZfqcsFP4', N'5CneYQz33XzOZKBeMOTwFO', N'Knowing Me, Knowing You', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (340, N'00GMnZ71KyvmEnZfqcsFP4', N'5FUbjEhsAV6SnuA33qhiGa', N'Take A Chance On Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (341, N'00GMnZ71KyvmEnZfqcsFP4', N'4EcCZJiu87nY1EdGtTs1TC', N'Mamma Mia', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (342, N'00GMnZ71KyvmEnZfqcsFP4', N'2Eti9d7wbABR3WKviUuzV8', N'Lay All Your Love On Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (343, N'00GMnZ71KyvmEnZfqcsFP4', N'77KOV2BXCOQM2rvC52v4Gd', N'Super Trouper', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (344, N'00GMnZ71KyvmEnZfqcsFP4', N'7ag8e1oEnmws1UVx0dxw5Y', N'I Have A Dream', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (345, N'00GMnZ71KyvmEnZfqcsFP4', N'0hByIDFmdFv8f6DejefIft', N'The Winner Takes It All', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (346, N'00GMnZ71KyvmEnZfqcsFP4', N'72FUO1NFsAUYCMEk7ZL3mL', N'Money, Money, Money', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (347, N'00GMnZ71KyvmEnZfqcsFP4', N'1qg0zw8yNgfeClchuFXvWD', N'S.O.S.', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (348, N'00GMnZ71KyvmEnZfqcsFP4', N'0YGeDaUHvgVt3gEinZcpoY', N'Chiquitita', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (349, N'00GMnZ71KyvmEnZfqcsFP4', N'3nMU3nDklCdzzNJW0FueBS', N'Fernando', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (350, N'00GMnZ71KyvmEnZfqcsFP4', N'0ayyT5zbXqlXEQWoa0JggL', N'Voulez-Vous', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (351, N'00GMnZ71KyvmEnZfqcsFP4', N'32KlLADzuIxZmHfhOdXMdC', N'Gimme! Gimme! Gimme! (A Man After Midnight)', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (352, N'00GMnZ71KyvmEnZfqcsFP4', N'2JIVeQQvIdyQvrz9Mhi6qL', N'Does Your Mother Know', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (353, N'00GMnZ71KyvmEnZfqcsFP4', N'1MTF3KweV9ntqiOeP5KWt5', N'One Of Us', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (354, N'00GMnZ71KyvmEnZfqcsFP4', N'7004vnGNsbGknoZanPA73k', N'The Name Of The Game', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (355, N'00GMnZ71KyvmEnZfqcsFP4', N'6uVfYIY1HhkhVoomfVLF2P', N'Thank You For The Music', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (356, N'00GMnZ71KyvmEnZfqcsFP4', N'7HI44W4E02t3DefnrBCTvX', N'Waterloo', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (357, N'00GMnZ71KyvmEnZfqcsFP4', N'30844qGbUl2Z70njqROPwe', N'Summer Night City', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (358, N'00GMnZ71KyvmEnZfqcsFP4', N'3nydleCAFFMqeTVlgjGaUe', N'Angel Eyes', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (359, N'00GMnZ71KyvmEnZfqcsFP4', N'0dnOroZwyVmIvIL9Gqvfrj', N'The Day Before You Came', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (360, N'00GMnZ71KyvmEnZfqcsFP4', N'30OAOWY18H9bHl5BC78vTE', N'Eagle - Short Version', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (361, N'00GMnZ71KyvmEnZfqcsFP4', N'3NyoaCkN9YUjx7LSID06P7', N'I Do, I Do, I Do, I Do, I Do', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (362, N'00GMnZ71KyvmEnZfqcsFP4', N'4GVkqWE7bqpmWhVvy9d8VL', N'So Long', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (363, N'00GMnZ71KyvmEnZfqcsFP4', N'7fBC5hsVNcPWvyifsaxhrP', N'Honey, Honey', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (364, N'00GMnZ71KyvmEnZfqcsFP4', N'1ak5NYGdh8LnKnl5JM9FKo', N'The Visitors', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (365, N'00GMnZ71KyvmEnZfqcsFP4', N'3eD67BNq5t5ri4pOX5AkzH', N'Our Last Summer', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (366, N'00GMnZ71KyvmEnZfqcsFP4', N'7qzcLl2lTz4J4GYheVAH4h', N'On And On And On', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (367, N'00GMnZ71KyvmEnZfqcsFP4', N'3b0Nr6Y18tveQmFiU1M1KQ', N'Ring Ring - English Version', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (368, N'00GMnZ71KyvmEnZfqcsFP4', N'38CDh9Z7eoqzke85dvvePw', N'I Wonder (Departure)', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (369, N'00GMnZ71KyvmEnZfqcsFP4', N'2l9SsVPFLHWYN7inUHP4Z4', N'Lovelight - Original Version', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (370, N'00GMnZ71KyvmEnZfqcsFP4', N'75Jf7iinHZY8Qg51Rb04Ex', N'Head Over Heels', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (371, N'00GMnZ71KyvmEnZfqcsFP4', N'2SLdCfAWKhECmnu8IjcVIZ', N'When I Kissed The Teacher', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (372, N'00GMnZ71KyvmEnZfqcsFP4', N'5z58zzeyUkUomHg2e8nQRI', N'I Am The City', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (373, N'00GMnZ71KyvmEnZfqcsFP4', N'0G1AF5qpIb9lhvaVibKjCN', N'Cassandra', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (374, N'00GMnZ71KyvmEnZfqcsFP4', N'1sGY94hq2FkUdDZNrSwWWE', N'Under Attack', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (375, N'00GMnZ71KyvmEnZfqcsFP4', N'1tvUYA1lqu1bYPM6TvjvI7', N'When All Is Said And Done', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (376, N'00GMnZ71KyvmEnZfqcsFP4', N'5m4KjEBmgDVWAErNwSdtNx', N'The Way Old Friends Do - Live At Wembley Arena, London, England / 1979', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (377, N'00GMnZ71KyvmEnZfqcsFP4', N'6XqaycqO8r8BQm9kAFP8Dm', N'She''s My Kind Of Girl', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (378, N'00GMnZ71KyvmEnZfqcsFP4', N'5GhB8ZvCId4BbA1mXcrT78', N'I Am Just A Girl', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (379, N'00GMnZ71KyvmEnZfqcsFP4', N'0yVYDQy7hT1rJd2tNDqUAb', N'Gonna Sing You My Love Song', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (380, N'00GMnZ71KyvmEnZfqcsFP4', N'6xIt3zfH5vnNQ3nCDbaUP6', N'King Kong Song', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (381, N'00GMnZ71KyvmEnZfqcsFP4', N'15HAR4J1UIVwGNI0pbyRP9', N'I''ve Been Waiting For You', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (382, N'00GMnZ71KyvmEnZfqcsFP4', N'77KYAMBVZlurqcwshSwnI1', N'Rock Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (383, N'00GMnZ71KyvmEnZfqcsFP4', N'1NNP9rBRmr2aCehIXyfDBN', N'Man In The Middle', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (384, N'00GMnZ71KyvmEnZfqcsFP4', N'2T1393juMpD8Gg3t4zkhCD', N'Intermezzo No.1', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (385, N'00GMnZ71KyvmEnZfqcsFP4', N'7kIjsEXg3hA55wJoTX5RtL', N'That''s Me', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (386, N'00GMnZ71KyvmEnZfqcsFP4', N'5f1kl9sMRO5aKiMQS7zkT2', N'Crazy World', N'Abba Gold Anniversary Edition', NULL)
GO
INSERT [dbo].[Playlist] ([ID], [AlbumID], [TrackID], [TrackName], [AlbumName], [ArtistName]) VALUES (387, N'00GMnZ71KyvmEnZfqcsFP4', N'3yBOe8roOX1Y1ZI8v0Gt4P', N'Happy Hawaii', N'Abba Gold Anniversary Edition', NULL)
GO
SET IDENTITY_INSERT [dbo].[Playlist] OFF
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (24, N'0c4IEciLCDdXEhhKxj4ThA', N'Madness', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/014c44998d46b5a2e52f9b75d1c28a187247d3c8', N'The 2nd Law', N'3KuXEGcqLcnEYWnn3OEGy0', N'https://i.scdn.co/image/2b412376036f7bc4394a120b9b7281442a6c2357', CAST(N'2012-09-24 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (25, N'4VqPOruhp5EdPBeR92t6lQ', N'Uprising', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/4fcb9dc0aa51f0f5e4f95ef550a813a89d9c395d', N'The Resistance', N'0eFHYz8NmK75zSplL5qlfM', N'https://i.scdn.co/image/f6500569e0b98137a6d26eee33286c5bb9ff623c', CAST(N'2009-09-10 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (26, N'3skn2lauGk7Dx6bVIt5DVj', N'Starlight', N'Muse', N'12Chz98pHFMPJEknJQMWvI', N'https://p.scdn.co/mp3-preview/0e946239cd2f8264b27f2ffb1e5ff0718290f679', N'Black Holes And Revelations', N'0lw68yx3MhKflWFqCsGkIs', N'https://i.scdn.co/image/6c751d61a730ab14dca55b1c7d3ce1f7f838aa23', CAST(N'2006-06-19 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (29, N'1UBQ5GK8JaQjm5VbkBZY66', N'Sharp Dressed Man (2008 Remastered LP Version)', N'ZZ Top', N'2AM4ilv6UzW0uMRuqKtDgN', N'https://p.scdn.co/mp3-preview/cde2a145ad66d756ef1717a97ed1841ee7048cfb', N'Eliminator', N'5LMGAYhn2ywaxGZdtmXGpw', N'https://i.scdn.co/image/832cbab41aa6239e672eb785f2ec3cbf788855ff', CAST(N'1983-03-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (30, N'7t6CAWplijBj4sdl0q3z0e', N'Legs (2008 Remastered Album Edit Version)', N'ZZ Top', N'2AM4ilv6UzW0uMRuqKtDgN', N'https://p.scdn.co/mp3-preview/b51737840dd206542d0ee61e479ac1269003987e', N'Eliminator', N'5LMGAYhn2ywaxGZdtmXGpw', N'https://i.scdn.co/image/832cbab41aa6239e672eb785f2ec3cbf788855ff', CAST(N'1983-03-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (31, N'11cPCZ0BYWJmAm7N8eDxtu', N'Johnny B. Goode - Single Version', N'Chuck Berry', N'293zczrfYafIItmnmM3coR', N'https://p.scdn.co/mp3-preview/aeb87cfd86fe72b286a83ebf34ff58b1f2374dd2', N'Berry Is On Top', N'2W3GOisQj5XAFbtxmbDBr5', N'https://i.scdn.co/image/a635693a4a861e794f6de41e853ad33849a7855a', CAST(N'1959-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (32, N'0N7LKqYxUrg5UFb6Z4OSDF', N'Hard To Handle', N'The Black Crowes', N'5krkohEVJYw0qoB5VWwxaC', N'https://p.scdn.co/mp3-preview/2d530e5a72343412463ad526ebb4acc6a89b0fec', N'Shake Your Money Maker', N'6QU6itggAYKtzjKOMqz8Ch', N'https://i.scdn.co/image/2f77e2ce3d040f113e420a0a18666c9f5ec43ddf', CAST(N'1990-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (35, N'1AhDOtG9vPSOmsWgNW0BEY', N'Bohemian Rhapsody - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/0fae7e2f08f20f23cb5393b2bd8291e1db6c7da9', N'A Night At The Opera (2011 Remaster)', N'1TSZDcvlPtAnekTaItI3qO', N'https://i.scdn.co/image/05e237f63c31eb4941753e5fb171e31cfca6a877', CAST(N'1975-11-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (36, N'4pbJqGIASGPr0ZpGpnWkDn', N'We Will Rock You - Remastered 2011', N'Queen', N'1dfeR4HaWDbWqFHLkxsg1d', N'https://p.scdn.co/mp3-preview/182947e6d8b9a048948cb74afd2675cb6dce135f', N'News Of The World (2011 Remaster)', N'7tB40pGzj6Tg0HePj2jWZt', N'https://i.scdn.co/image/249cb44ec1b26a567ae996bcea62fb8226910899', CAST(N'1977-10-28 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (37, N'32OlwWuMpZ6b0aN2RZOeMS', N'Uptown Funk', N'Mark Ronson', N'3hv9jJF3adDNsBSIQDqcjp', N'https://p.scdn.co/mp3-preview/57fbea25cab128a8ec695af69e58dd5a98ba1e7c', N'Uptown Special', N'3vLaOYCNCzngDf8QdBg2V1', N'https://i.scdn.co/image/ae0c6b9da25cd8c02c958fd4998b1807c9238e07', CAST(N'2015-01-12 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (40, N'7LygtNjQ65PSdzVjUnHXQb', N'Cherry Pie', N'Warrant', N'7HLvzuM9p11k9lUQfSM4Rq', N'https://p.scdn.co/mp3-preview/ad7b0fa8685ba6a4d4a3831b494b612989b3360d', N'Cherry Pie', N'4LgsHyufRmmcB1HIqTES19', N'https://i.scdn.co/image/dfa1cedc593f6cb06adfc8fc830fe5e3d3eec440', CAST(N'1990-10-04 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tracks] ([ID], [TrackID], [TrackName], [ArtistName], [ArtistID], [TrackPreviewURL], [AlbumName], [AlbumID], [AlbumImageURL], [AlbumDate]) VALUES (41, N'6mcxQ1Y3uQRU0IHsvdNLH1', N'Where Is My Mind? (Remastered)', N'Pixies', N'6zvul52xwTWzilBZl6BUbT', N'https://p.scdn.co/mp3-preview/f5b45332151a7dab439016940779c9524fc8e1bd', N'Surfer Rosa & Come On Pilgrim', N'2l7RPWC3E6eStJJLBsUeCI', N'https://i.scdn.co/image/9bf3ad2f0954dd692d5894a31ff33b2163ec62f0', CAST(N'1988-01-01 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPlaylists] ON 

GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (26, N'davemateer', N'0c4IEciLCDdXEhhKxj4ThA')
GO
INSERT [dbo].[UserPlaylists] ([ID], [UserID], [TrackID]) VALUES (27, N'davemateer', N'11cPCZ0BYWJmAm7N8eDxtu')
GO
SET IDENTITY_INSERT [dbo].[UserPlaylists] OFF
GO
