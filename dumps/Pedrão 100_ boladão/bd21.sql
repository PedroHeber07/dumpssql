CREATE TABLE amigo (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80),
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE telefone (
    idtel INT NOT NULL AUTO_INCREMENT, 
    numero VARCHAR(10),
    tipo VARCHAR(10),
    amigo_id INT,
    PRIMARY KEY (idtel),
    INDEX (amigo_id),
    FOREIGN KEY (amigo_id)
      REFERENCES amigo(id)
) ENGINE=INNODB;




CREATE TABLE product (
    category INT NOT NULL, id INT NOT NULL,
    price DECIMAL,
    PRIMARY KEY(category, id)
)   ENGINE=INNODB;

CREATE TABLE customer (
    id INT NOT NULL,
    PRIMARY KEY (id)
)   ENGINE=INNODB;

CREATE TABLE product_order (
    no INT NOT NULL AUTO_INCREMENT,
    product_category INT NOT NULL,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,

    PRIMARY KEY(no),
    INDEX (product_category, product_id),
    INDEX (customer_id),

    FOREIGN KEY (product_category, product_id)
      REFERENCES product(category, id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

    FOREIGN KEY (customer_id)
      REFERENCES customer(id)
)   ENGINE=INNODB;