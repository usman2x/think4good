CREATE TABLE `think4good`.`project_categories`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NULL,
  `description` LONGTEXT NULL,
  `created_by` VARCHAR(255) NULL,
  `updated_by` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `think4good`.`developers` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `developer_id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NULL,
  `story` LONGTEXT NULL,
  `web_link` VARCHAR(255) NULL,
  `github` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `zip` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `mobile` VARCHAR(255) NULL,
  `lat_lang` VARCHAR(255) NULL,
  `picture_link` LONGTEXT NULL,
  `status` TINYINT(1) ZEROFILL NULL DEFAULT 0,
  `created_by` VARCHAR(255) NULL,
  `updated_by` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
UNIQUE INDEX `developer_id_UNIQUE` (`developer_id` ASC) VISIBLE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `think4good`.`projects` (
  `id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `project_id` VARCHAR(255) NOT NULL,
  `developer_id` VARCHAR(255) NOT NULL,
  `category_id` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NULL,
  `state` VARCHAR(255) NULL,
  `description` LONGTEXT NULL,
  `content` LONGTEXT NULL,
  `web_link` LONGTEXT NULL,
  `image_link` LONGTEXT NULL,
  `created_by` VARCHAR(255) NULL,
  `updated_by` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `project_id_UNIQUE` (`project_id` ASC) VISIBLE,
      INDEX `fk_projects_category_id_idx` (`category_id` ASC) VISIBLE,
      INDEX `fk_projects_developer_id_idx` (`developer_id` ASC) VISIBLE,
      CONSTRAINT `fk_projects_category_id`
        FOREIGN KEY (`category_id`)
        REFERENCES `think4good`.`project_categories` (`category_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
      CONSTRAINT `fk_projects_developer_id`
        FOREIGN KEY (`developer_id`)
        REFERENCES `think4good`.`developers` (`developer_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `think4good`.`comments`(
  `id` BIGINT(30) NOT NULL AUTO_INCREMENT,
  `description` LONGTEXT NULL,
  `project_id` VARCHAR(255) NULL,
  `developer_id` VARCHAR(255) NULL,
  `created_by` VARCHAR(255) NULL,
  `updated_by` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
    INDEX `fk_comments_developer_id_idx` (`developer_id` ASC) VISIBLE,
    INDEX `fk_comments_project_id_idx` (`project_id` ASC) VISIBLE,
    CONSTRAINT `fk_comments_developer_id`
      FOREIGN KEY (`developer_id`)
      REFERENCES `think4good`.`developers` (`developer_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT `fk_comments_project_id`
      FOREIGN KEY (`project_id`)
      REFERENCES `think4good`.`projects` (`project_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `think4good`.`project_subscriptions` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vote` TINYINT(1) ZEROFILL NULL DEFAULT 0,
  `subscribe` TINYINT(1) ZEROFILL NULL DEFAULT 0,
  `project_id` VARCHAR(255) NULL,
  `developer_id` VARCHAR(255) NULL,
   `created_by` VARCHAR(255) NULL,
   `updated_by` VARCHAR(255) NULL,
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_project_subscriptions_developer_id_idx` (`developer_id` ASC) VISIBLE,
  INDEX `fk_project_subscriptions_project_id_idx` (`project_id` ASC) VISIBLE,
  CONSTRAINT `fk_project_subscriptions_developer_id`
    FOREIGN KEY (`developer_id`)
    REFERENCES `think4good`.`developers` (`developer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_subscriptions_project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `think4good`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `think4good`.`developers` (`developer_id`, `name`, `story`) VALUES ('hafizusman530', 'M usman', 'dummy');
INSERT INTO `think4good`.`project_categories` (`category_id`, `name`, `description`) VALUES ('ED_TECH', 'Ed Tech', 'Ed Tech');
INSERT INTO `think4good`.`projects` (`project_id`, `developer_id`, `category_id`, `title`, `state`, `description`) VALUES ('PRO_1', 'hafizusman530', 'ED_TECH', 'Title', 'init', 'description');
