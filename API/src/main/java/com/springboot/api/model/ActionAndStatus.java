package com.springboot.api.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ActionAndStatus {
    private String id;
    private String operation_type;
    private String operation_status;
}
