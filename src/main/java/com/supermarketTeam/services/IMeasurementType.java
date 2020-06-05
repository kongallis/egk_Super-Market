package com.supermarketTeam.services;

import com.supermarketTeam.dto.MeasurementTypeRegistrationDto;
import com.supermarketTeam.entities.MeasurementType;
import java.util.List;

public interface IMeasurementType {

    public MeasurementType findById(int id);

    public List<MeasurementType> listAll();

    public MeasurementType save(MeasurementTypeRegistrationDto measurementType);

    public void delete(MeasurementType measurementType);

    public MeasurementType update(MeasurementType measurementType);
}
