-- ����������
SET FOREIGN_KEY_CHECKS=0;

-- ����Ա�˻���
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable` (
  `aname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- �������Ա�û�
INSERT INTO ausertable VALUES ('admin', 'admin');

-- �˿��˻���
DROP TABLE IF EXISTS `busertable`;
CREATE TABLE `busertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bpwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ���ﳵ��
DROP TABLE IF EXISTS `carttable`;
CREATE TABLE `carttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`busertable_id`),
  KEY `gno` (`goodstable_id`),
  CONSTRAINT `bid` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- �û���ע��
DROP TABLE IF EXISTS `focustable`;
CREATE TABLE `focustable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) NOT NULL,
  `busertable_id` int(11) NOT NULL,
  `focustime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gno1` (`goodstable_id`),
  KEY `bid1` (`busertable_id`),
  CONSTRAINT `bid1` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno1` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ��Ʒ��
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goprice` double DEFAULT NULL,
  `grprice` double DEFAULT NULL,
  `gstore` int(11) DEFAULT NULL,
  `gpicture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodstype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`goodstype_id`),
  CONSTRAINT `typeid` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ��Ʒ����
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- �����
DROP TABLE IF EXISTS `noticetable`;
CREATE TABLE `noticetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ncontent` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ntime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ������
DROP TABLE IF EXISTS `orderbasetable`;
CREATE TABLE `orderbasetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `orderdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid2` (`busertable_id`),
  CONSTRAINT `bid2` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ���������
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odsn` (`orderbasetable_id`),
  KEY `gno3` (`goodstable_id`),
  CONSTRAINT `odsn` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`),
  CONSTRAINT `gno3` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ���۱�
DROP TABLE IF EXISTS `profittable`;
CREATE TABLE `profittable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `profitDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pg` (`goods_id`),
  KEY `pt` (`type_id`),
  CONSTRAINT `pg` FOREIGN KEY (`goods_id`) REFERENCES `goodstable` (`id`),
  CONSTRAINT `pt` FOREIGN KEY (`type_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ÿ�µ���������
SELECT YEAR(orderdate) YEAR,MONTH(orderdate) MONTH,SUM(amount) amount FROM orderbasetable WHERE STATUS=1 GROUP BY YEAR(orderdate),MONTH(orderdate)
-- ÿ�µ���������
SELECT goodstype.typename,SUM(goodstable.grprice) amount FROM orderbasetable
LEFT JOIN orderdetail ON orderbasetable.id = orderdetail.orderbasetable_id
LEFT JOIN goodstable ON goodstable.id = orderdetail.goodstable_id
LEFT JOIN goodstype ON goodstype.id = goodstable.goodstype_id
WHERE STATUS=1
GROUP BY goodstable.goodstype_id