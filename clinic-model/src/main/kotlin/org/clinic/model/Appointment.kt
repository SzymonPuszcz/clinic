package org.clinic.model

import org.hibernate.annotations.GenericGenerator
import java.time.LocalDateTime
import java.util.UUID
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToOne
import javax.persistence.Table

@Entity
@Table(name = "appointments")
data class Appointment(
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
        name = "UUID",
        strategy = "org.hibernate.id.UUIDGenerator"
    )
    var id: UUID,

    @ManyToOne(optional = false)
    var doctor: Doctor,

    @ManyToOne(optional = false)
    var patient: Patient,

    @Column(nullable = false)
    var startDate: LocalDateTime,

    @Column(nullable = false)
    var location: String
)
