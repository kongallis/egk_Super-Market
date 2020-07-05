package com.supermarketTeam.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "measurementtypes", catalog = "supermarket2", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MeasurementType.findAll", query = "SELECT m FROM MeasurementType m")
    , @NamedQuery(name = "MeasurementType.findById", query = "SELECT m FROM MeasurementType m WHERE m.id = :id")
    , @NamedQuery(name = "MeasurementType.findByType", query = "SELECT m FROM MeasurementType m WHERE m.type = :type")})
@JsonIgnoreProperties(value = {"productList"})
public class MeasurementType implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "type", nullable = false, length = 10)
    private String type;
    @JsonManagedReference
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "measurementId")
    private List<Product> productList;

    public MeasurementType() {
    }

    public MeasurementType(Integer id) {
        this.id = id;
    }

    public MeasurementType(Integer id, String type) {
        this.id = id;
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @XmlTransient
    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MeasurementType)) {
            return false;
        }
        MeasurementType other = (MeasurementType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.bbb.entities.MeasurementType[ id=" + id + " ]";
    }

}
