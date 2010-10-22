CREATE TABLE `flights` (
  `id` int(11) NOT NULL auto_increment,
  `dipature` datetime default NULL,
  `arrival` datetime default NULL,
  `destination` varchar(255) collate utf8_unicode_ci default NULL,
  `baggage_allowance` decimal(10,0) default NULL,
  `capacity` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `seats` (
  `id` int(11) NOT NULL auto_increment,
  `flight_id` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `contact_no` decimal(10,0) default NULL,
  `baggage` decimal(10,0) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20101021102852');

INSERT INTO schema_migrations (version) VALUES ('20101021103616');