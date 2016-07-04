package org.cats.core;

import javax.annotation.Generated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class AbstractDomain {
    @Id
    @GeneratedValue
    private Long id;


}
