
CREATE TABLE `tctq_btc_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` char(36) NOT NULL COMMENT '地址',
  `type` varchar(4) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_index` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `tctq_btc_utxo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txid` char(64) NOT NULL,
  `vout` int(11) NOT NULL,
  `count` decimal(64,0) NOT NULL,
  `script_pub_key` text NOT NULL,
  `address` varchar(40) NOT NULL,
  `sync_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `block_height` int(11) NOT NULL,
  `status` varchar(4) NOT NULL COMMENT '1-out未推送，2-out已推送，3-in未推送，4-in已推送',
  PRIMARY KEY (`id`),
  UNIQUE KEY `txid_vout_unique_key` (`txid`,`vout`),
  KEY `address` (`address`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tsys_config`(type, ckey, cvalue, updater, update_datetime, remark) VALUES ('0','curScBlockNumber','0','code',now(),'SC下次从哪个区块开始扫描');