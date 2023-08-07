package model;

import java.sql.Date;

public class Question {
    private Long id;
    private String name;
    private Date create_at;

    private ELever lever;
    private String countTrue;
    private String countFalse;

    private Category category;
    private Group group;

    public Question() {
    }

    public Question(Long id, String name, Date create_at, ELever lever, String countTrue, String countFalse, Category category, Group group) {
        this.id = id;
        this.name = name;
        this.create_at = create_at;
        this.lever = lever;
        this.countTrue = countTrue;
        this.countFalse = countFalse;
        this.category = category;
        this.group = group;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public ELever getLever() {
        return lever;
    }

    public void setLever(ELever lever) {
        this.lever = lever;
    }

    public String getCountTrue() {
        return countTrue;
    }

    public void setCountTrue(String countTrue) {
        this.countTrue = countTrue;
    }

    public String getCountFalse() {
        return countFalse;
    }

    public void setCountFalse(String countFalse) {
        this.countFalse = countFalse;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
}
