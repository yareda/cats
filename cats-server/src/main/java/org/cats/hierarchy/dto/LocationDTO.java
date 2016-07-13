package org.cats.hierarchy.dto;

import java.util.List;

public class LocationDTO {
    private Long id;
    private Long locationType;
    private String name;
    private String code;
    private LocationDTO parent;
    private List<LocationDTO> children;

    LocationDTO(){}

    public LocationDTO(Long id, Long locationType, String name,String code,LocationDTO parent, List<LocationDTO> children){
        this.id = id;
        this.locationType = locationType;
        this.name = name;
        this.code = code;
        this.parent = parent;
        this.children = children;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getLocationType() {
        return locationType;
    }

    public void setLocationType(Long locationType) {
        this.locationType = locationType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public LocationDTO getParent() {
        return parent;
    }

    public void setParent(LocationDTO parent) {
        this.parent = parent;
    }

    public List<LocationDTO> getChildren() {
        return children;
    }

    public void setChildren(List<LocationDTO> children) {
        this.children = children;
    }
}
