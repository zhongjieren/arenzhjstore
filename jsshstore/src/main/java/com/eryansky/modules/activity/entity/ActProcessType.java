/**
 *  Copyright (c) 2012-2014 http://www.eryansky.com
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.eryansky.modules.activity.entity;

import com.eryansky.common.excel.annotation.Excel;
import com.eryansky.common.orm.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.common.collect.Lists;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.List;

/**
 * 系统字典类型Entity.
 * 
 * @author : 尔演&Eryan eryanwcp@gmail.com
 * @date : 2013-1-23 下午9:08:36
 */

@Entity
@Table(name = "T_ACT_ACTPROCESSTYPE")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer" , "handler","fieldHandler",
        "groupActProcessType","subActProcessTypes" })
@SuppressWarnings("serial")
public class ActProcessType extends BaseEntity {
	
	/**
	 * 类型名称
	 */
	@Excel(exportName="类型名称", exportFieldWidth = 30)
	private String name;
	/**
	 * 类型编码
	 */
	@Excel(exportName="类型编码", exportFieldWidth = 20)
	private String code;

    /**
     * 父级类型 即分组
     */
    private ActProcessType groupActProcessType;
    /**
     * @Transient 父级类型 即分组名称
     */
    private String groupActProcessTypeName;
    /**
     * @Transient 父级类型 即分组编码
     */
    private String groupActProcessTypeCode;
    /**
     * 子ActProcessType集合
     */
    private List<ActProcessType> subActProcessTypes = Lists.newArrayList();
    /**
     * 备注
     */
    private String remark;

	/**
	 * 排序
	 */
	@Excel(exportName="排序", exportFieldWidth = 10)
	private Integer orderNo;

	public ActProcessType() {
		super();
	}

    public ActProcessType(Long id) {
        this();
        super.id = id;
    }

    /**
	 * 系统数据字典类型构造函数.
	 * 
	 * @param name
	 *            类型名称
	 * @param code
	 *            类型编码
	 * @param orderNo
	 *            排序
	 */
	public ActProcessType(String name, String code, Integer orderNo) {
		super();
		this.name = name;
		this.code = code;
		this.orderNo = orderNo;
	}

	@Column(name = "NAME",length = 100, unique = true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "CODE",length = 36, unique = true)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

    @ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(name = "GROUP_CODE", referencedColumnName = "CODE")
    public ActProcessType getGroupActProcessType() {
        return groupActProcessType;
    }

    public void setGroupActProcessType(ActProcessType groupActProcessType) {
        this.groupActProcessType = groupActProcessType;
    }

    @Transient
    public String getGroupActProcessTypeName() {
        if(groupActProcessType != null){
            groupActProcessTypeName = groupActProcessType.getName();
        }
        return groupActProcessTypeName;
    }

    public void setGroupActProcessTypeName(String groupActProcessTypeName) {
        this.groupActProcessTypeName = groupActProcessTypeName;
    }

    @Transient
    @JsonProperty("_parentId")
    public String getGroupActProcessTypeCode() {
        if(groupActProcessType != null){
            groupActProcessTypeCode = groupActProcessType.getCode();
        }
        return groupActProcessTypeCode;
    }

    public void setGroupActProcessTypeCode(String groupActProcessTypeCode) {
        this.groupActProcessTypeCode = groupActProcessTypeCode;
    }

    @OneToMany(mappedBy = "groupActProcessType",fetch = FetchType.EAGER)
    public List<ActProcessType> getSubActProcessTypes() {
        return subActProcessTypes;
    }

    public void setSubActProcessTypes(List<ActProcessType> subActProcessTypes) {
        this.subActProcessTypes = subActProcessTypes;
    }
    @Column(name = "REMARK")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column(name = "ORDER_NO")
	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

}