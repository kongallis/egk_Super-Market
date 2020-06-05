package com.supermarketTeam.services;

import com.supermarketTeam.dao.MeasurementTypeRepository;
import com.supermarketTeam.dto.MeasurementTypeRegistrationDto;
import com.supermarketTeam.entities.MeasurementType;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class MeasurementTypeImpl implements IMeasurementType {

    @Autowired
    private MeasurementTypeRepository mTypeRepo;

    @Override
    public MeasurementType findById(int id) {
        return mTypeRepo.findById(id).get();
    }

    @Override
    public List<MeasurementType> listAll() {
        return mTypeRepo.findAll();
    }

    @Override
    public MeasurementType save(MeasurementTypeRegistrationDto measurementType) {
        MeasurementType mType = new MeasurementType();
        mType.setType(measurementType.getType());
        return mTypeRepo.save(mType);
    }

    @Override
    public void delete(MeasurementType measurementType) {
        mTypeRepo.delete(measurementType);
    }

    @Override
    public MeasurementType update(MeasurementType measurementType) {
        MeasurementType dbMType = mTypeRepo.findById(measurementType.getId()).get();
        if (dbMType != null) {
            dbMType.setType(measurementType.getType());
            return mTypeRepo.save(measurementType);
        }
        return null;
    }

}
