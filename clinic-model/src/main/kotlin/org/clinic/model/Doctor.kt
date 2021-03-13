package org.clinic.model

import org.clinic.model.enum.Specialisation
import org.hibernate.annotations.GenericGenerator
import java.util.UUID
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.EnumType
import javax.persistence.Enumerated
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import javax.persistence.Table

@Entity
@Table(name = "doctors")
data class Doctor(
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
        name = "UUID",
        strategy = "org.hibernate.id.UUIDGenerator"
    )
    var id: UUID,

    @Column(nullable = false)
    var firstName: String,

    @Column(nullable = false)
    var lastName: String,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    var specialisation: Specialisation,

    @OneToMany(cascade = [CascadeType.ALL], mappedBy = "doctor")
    var appointments: MutableList<Appointment> = mutableListOf()
)
