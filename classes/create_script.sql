SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sedesis` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sedesis` ;

-- -----------------------------------------------------
-- Table `sedesis`.`privilegios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`privilegios` (
  `idprivilegio` VARCHAR(10) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idprivilegio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`nacionalidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`nacionalidades` (
  `idnacionalidad` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `estado` CHAR(1) NULL DEFAULT '1' ,
  PRIMARY KEY (`idnacionalidad`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`estados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`estados` (
  `id` INT NOT NULL ,
  `clave` VARCHAR(2) NULL ,
  `nombre` VARCHAR(45) NULL ,
  `abrev` VARCHAR(16) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`municipios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`municipios` (
  `id` INT NOT NULL ,
  `estado_id` INT NOT NULL ,
  `clave` VARCHAR(3) NULL ,
  `nombre` VARCHAR(80) NOT NULL ,
  `sigla` VARCHAR(4) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_identidad_key_idx` (`estado_id` ASC) ,
  CONSTRAINT `fk_identidad_key`
    FOREIGN KEY (`estado_id` )
    REFERENCES `sedesis`.`estados` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`localidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`localidades` (
  `idlocalidad` INT NOT NULL ,
  `municipio_id` INT NOT NULL ,
  `clave` VARCHAR(4) NULL ,
  `nombre` VARCHAR(110) NOT NULL ,
  `latitud` VARCHAR(10) NULL ,
  `longitud` VARCHAR(10) NULL ,
  `altitud` VARCHAR(4) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idlocalidad`) ,
  INDEX `fk_idmunicipio_key_idx` (`municipio_id` ASC) ,
  CONSTRAINT `fk_idmunicipio_key`
    FOREIGN KEY (`municipio_id` )
    REFERENCES `sedesis`.`municipios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`direcciones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`direcciones` (
  `iddireccion` VARCHAR(20) NOT NULL ,
  `direccion` TEXT NULL ,
  `coordenadas` VARCHAR(20) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`iddireccion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`perfil_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`perfil_persona` (
  `idperfil` VARCHAR(20) NOT NULL ,
  `descripcion` TEXT NULL ,
  `facebook_user` VARCHAR(70) NULL ,
  `twitter_user` VARCHAR(50) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idperfil`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`fotografia_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`fotografia_persona` (
  `idfotografia` VARCHAR(20) NOT NULL ,
  `url_fotografia` VARCHAR(100) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idfotografia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`ultimos_estudios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`ultimos_estudios` (
  `idestudios` VARCHAR(20) NOT NULL ,
  `descripcion` VARCHAR(50) NULL ,
  `institucion` VARCHAR(80) NULL ,
  `periodo` VARCHAR(10) NULL ,
  `documento` VARCHAR(45) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idestudios`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`detalle_personas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`detalle_personas` (
  `iddetalle` VARCHAR(20) NOT NULL ,
  `idnacionalidad` INT NULL ,
  `idlocalidad` INT NULL ,
  `idfotografia` VARCHAR(20) NULL ,
  `iddireccion` VARCHAR(20) NULL ,
  `idperfil` VARCHAR(20) NULL ,
  `idestudios` VARCHAR(20) NULL ,
  PRIMARY KEY (`iddetalle`) ,
  INDEX `fk_nacionalidad_key_idx` (`idnacionalidad` ASC) ,
  INDEX `fk_localidad_key_idx` (`idlocalidad` ASC) ,
  INDEX `fk_direccion_key_idx` (`iddireccion` ASC) ,
  INDEX `fk_perfil_key_idx` (`idperfil` ASC) ,
  INDEX `fk_foto_key_idx` (`idfotografia` ASC) ,
  INDEX `fk_estudios_key_idx` (`idestudios` ASC) ,
  CONSTRAINT `fk_nacionalidad_key`
    FOREIGN KEY (`idnacionalidad` )
    REFERENCES `sedesis`.`nacionalidades` (`idnacionalidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_localidad_key`
    FOREIGN KEY (`idlocalidad` )
    REFERENCES `sedesis`.`localidades` (`idlocalidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccion_key`
    FOREIGN KEY (`iddireccion` )
    REFERENCES `sedesis`.`direcciones` (`iddireccion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_key`
    FOREIGN KEY (`idperfil` )
    REFERENCES `sedesis`.`perfil_persona` (`idperfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_foto_key`
    FOREIGN KEY (`idfotografia` )
    REFERENCES `sedesis`.`fotografia_persona` (`idfotografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudios_key`
    FOREIGN KEY (`idestudios` )
    REFERENCES `sedesis`.`ultimos_estudios` (`idestudios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`personas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`personas` (
  `curp` VARCHAR(20) NOT NULL ,
  `primerap` VARCHAR(70) NULL ,
  `segundoap` VARCHAR(45) NULL ,
  `nombre` VARCHAR(45) NULL ,
  `fechanac` VARCHAR(45) NULL ,
  `genero` VARCHAR(15) NULL ,
  `iddetalle` VARCHAR(20) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  INDEX `fk_iddetalle_key_idx` (`iddetalle` ASC) ,
  PRIMARY KEY (`curp`) ,
  CONSTRAINT `fk_iddetalle_key`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`usuarios` (
  `curp` VARCHAR(20) NOT NULL ,
  `passwd` VARCHAR(100) NOT NULL ,
  `email` VARCHAR(50) NOT NULL ,
  `idprivilegio` VARCHAR(10) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `idprivilegio_idx` (`idprivilegio` ASC) ,
  INDEX `fk_idcurp_key_idx` (`curp` ASC) ,
  CONSTRAINT `idprivilegio`
    FOREIGN KEY (`idprivilegio` )
    REFERENCES `sedesis`.`privilegios` (`idprivilegio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idcurp_key`
    FOREIGN KEY (`curp` )
    REFERENCES `sedesis`.`personas` (`curp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`telefonos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`telefonos` (
  `idtelefono` VARCHAR(20) NOT NULL ,
  `telefono` VARCHAR(20) NULL ,
  `descripcion` VARCHAR(20) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idtelefono`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`telefonos_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`telefonos_persona` (
  `iddetalle` VARCHAR(20) NOT NULL ,
  `idtelefono` VARCHAR(20) NOT NULL ,
  INDEX `fk_telefono_key_idx` (`idtelefono` ASC) ,
  INDEX `fk_detalle_persona_key_idx` (`iddetalle` ASC) ,
  CONSTRAINT `fk_telefono_key`
    FOREIGN KEY (`idtelefono` )
    REFERENCES `sedesis`.`telefonos` (`idtelefono` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_persona_key`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`habilidades_profesionales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`habilidades_profesionales` (
  `idhabilidades` VARCHAR(20) NOT NULL ,
  `habilidad` VARCHAR(50) NULL ,
  `tipo` VARCHAR(20) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idhabilidades`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`experiencias_profesionales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`experiencias_profesionales` (
  `idexperiencia` VARCHAR(20) NOT NULL ,
  `descripcion` TEXT NULL ,
  `institucion` VARCHAR(80) NULL ,
  `anio` INT NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idexperiencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`idiomas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`idiomas` (
  `ididioma` VARCHAR(20) NOT NULL ,
  `idioma` VARCHAR(45) NULL ,
  `nivel_idioma` VARCHAR(45) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`ididioma`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`logros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`logros` (
  `idlogro` VARCHAR(20) NOT NULL ,
  `logro` TEXT NULL ,
  `institucion` VARCHAR(80) NULL ,
  `anio` INT NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idlogro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`cursos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`cursos` (
  `idcurso` VARCHAR(20) NOT NULL ,
  `curso` TEXT NULL ,
  `tipo` VARCHAR(15) NULL ,
  `institucion` VARCHAR(100) NULL ,
  `anio` INT NULL ,
  `documento` VARCHAR(20) NULL ,
  `estado` CHAR(1) NULL DEFAULT '2' ,
  PRIMARY KEY (`idcurso`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`logros_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`logros_persona` (
  `idlogro` VARCHAR(20) NOT NULL ,
  `iddetalle` VARCHAR(20) NOT NULL ,
  INDEX `fk_logro_det_idx` (`idlogro` ASC) ,
  INDEX `fk_logro_per_idx` (`iddetalle` ASC) ,
  CONSTRAINT `fk_logro_det`
    FOREIGN KEY (`idlogro` )
    REFERENCES `sedesis`.`logros` (`idlogro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_logro_per`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`idiomas_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`idiomas_persona` (
  `ididioma` VARCHAR(20) NOT NULL ,
  `iddetalle` VARCHAR(20) NOT NULL ,
  INDEX `fk_idioma_per_key_idx` (`ididioma` ASC) ,
  INDEX `fk_idioma_det_key_idx` (`iddetalle` ASC) ,
  CONSTRAINT `fk_idioma_per_key`
    FOREIGN KEY (`ididioma` )
    REFERENCES `sedesis`.`idiomas` (`ididioma` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idioma_det_key`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`experiencias_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`experiencias_persona` (
  `idexperiencia` VARCHAR(20) NOT NULL ,
  `iddetalle` VARCHAR(20) NOT NULL ,
  INDEX `fk_experiencia_per_idx` (`idexperiencia` ASC) ,
  INDEX `fk_experiencia_det_idx` (`iddetalle` ASC) ,
  CONSTRAINT `fk_experiencia_per`
    FOREIGN KEY (`idexperiencia` )
    REFERENCES `sedesis`.`experiencias_profesionales` (`idexperiencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_det`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`habilidades_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`habilidades_persona` (
  `idhabilidad` VARCHAR(20) NOT NULL ,
  `iddetalle` VARCHAR(20) NOT NULL ,
  INDEX `fk_habilidad_per_idx` (`idhabilidad` ASC) ,
  INDEX `fk_habilidad_det_idx` (`iddetalle` ASC) ,
  CONSTRAINT `fk_habilidad_per`
    FOREIGN KEY (`idhabilidad` )
    REFERENCES `sedesis`.`habilidades_profesionales` (`idhabilidades` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habilidad_det`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sedesis`.`cursos_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sedesis`.`cursos_persona` (
  `idcurso` VARCHAR(20) NOT NULL ,
  `iddetalle` VARCHAR(20) NOT NULL ,
  INDEX `fk_curso_per_idx` (`idcurso` ASC) ,
  INDEX `fk_curso_det_idx` (`iddetalle` ASC) ,
  CONSTRAINT `fk_curso_per`
    FOREIGN KEY (`idcurso` )
    REFERENCES `sedesis`.`cursos` (`idcurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_det`
    FOREIGN KEY (`iddetalle` )
    REFERENCES `sedesis`.`detalle_personas` (`iddetalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sedesis` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
